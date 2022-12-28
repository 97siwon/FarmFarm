
// const row = document.getElementById("commentRow")
// const pro = document.querySelector("writer-profile");

// if(row.classList.contains("comment-child")){
//     pro.classList.add("child-img");
// }else{
//     pro.classList.add("parent-img");
// }

function selectCommentList(){

    $.ajax({
        url : "/board/comment/list",
        data : {"boardNo" : boardNo},
        dataType : "JSON",
        success : (coList)=>{

            console.log(coList);

            // 화면에 나온 댓글들을 싹 지웁니다
            const commentList = document.querySelector(".comment-list");
            commentList.innerHTML="";

            // 댓글이 없다면!
            if(coList.length == 0){
                commentWriter.classList.add("emptyComment");
                commentWriter.innerText = "첫 번째 댓글을 달아보세요";
                
            }else{ // 댓글이 있따면!!
                
                // coList 요소들을 하나씩 꺼내볼까요~?
                for(let comment of coList){
                    
                    // 댓글 li태그
                    const commentRow = document.createElement("li");
                    commentRow.classList.add("comment-row");
        
                    
                    // 댓글 작성자의 인적사항
                    const commentWriter = document.createElement("div");
                    commentWriter.classList.add("comment-writer");
    
                    // 자식 댓글인 경우
                    if(comment.commentParent != 0){
                        commentRow.classList.add("comment-child")
                    }

    
                    // 댓글 작성자의 프로필 이미지
                    const writerProfile = document.createElement("div");
                    writerProfile.classList.add("writer-profile");
                    const profileImage = document.createElement("img");
                    profileImage.classList.add("proImg");
                    if(comment.profileImg != null){ // 등록된 프로필 이미지 있음
                        profileImage.setAttribute("src", comment.profileImg);
                    }else{
                        profileImage.setAttribute("src", "/resources/images/myPage/profile/profileImg.png");
                    }
    
                    // 작성자 이름
                    const writerName = document.createElement("div");
                    writerName.classList.add("writer-name");
                    writerName.innerText = comment.memberNickname;
    
                    // // 댓글 좋아용~
                    // const commentLike = document.createElement("div");
                    // commentLike.classList.add("comment-like");
    
                    // 댓글 내용 부분
                    const commentContent = document.createElement("div");
                    commentContent.classList.add("comment-content");
                    // 댓글 내용
                    const contentPre = document.createElement("div");
                    contentPre.innerHTML = comment.commentContent;

                    // 작성일 + 답글달기
                    // 작성일
                    const writeTimeReply = document.createElement("div");
                    writeTimeReply.classList.add("writer-time-reply");
                    writeTimeReply.innerHTML = comment.commentDate + '&nbsp; |';
                    // 답글달기
                    const commentReply = document.createElement("button");
                    commentReply.classList.add("comment-reply");
                    commentReply.setAttribute("onclick", "showReply("+comment.commentNo+", this)");
                    commentReply.innerHTML = ' &nbsp;답글달기&nbsp;';

                    if(memberNo == comment.memberNo){
                        const commentInsert = document.createElement("button");
                        const commentDelete = document.createElement("button");

                        commentInsert.classList.add("comment-reply");
                        commentDelete.classList.add("comment-reply");

                        commentInsert.innerHTML = "|&nbsp;&nbsp;수정&nbsp;";
                        commentDelete.innerHTML = "|&nbsp;&nbsp;수정&nbsp;";

                        commentInsert.setAttribute("onclick", "updateComment("+comment.commentNo+", this)");
                        commentDelete.setAttribute("onclick", "deleteComment(this)");
                    }

                    
                    if(commentRow.classList.contains("comment-child")){
                        writerProfile.classList.add("child-img");
                        writerName.classList.add("child-content");
                        commentContent.classList.add("child-content");
                    }else{
                        writerProfile.classList.add("parent-img");
                    }

    
                    // 자~ append 해볼까
                    commentList.append(commentRow);
                    commentRow.append(commentWriter, commentContent,writeTimeReply);
                    
                    commentWriter.append(writerProfile, writerName);
                    writerProfile.append(profileImage);
                    
                    commentContent.append(contentPre);
                    
                    writeTimeReply.append(commentReply);
                }
            }
        },
        error : (req, status, error)=>{
            console.log("댓글 ajax 통신 실패ㅠㅜ");
        }
    });
}

// 댓글 등록
const commentInsert = document.querySelector(".comment-insert");
const writeComment = document.querySelector(".write-comment");

commentInsert.addEventListener("click", e=>{

    // 1. 로그인이 되었는가

    // 댓글 작성이 됐는지 확인을 해볼까요~?
    if(writeComment.value.trim().length == 0){
        alert("댓글을 작성해주세요");
        writeComment.value="";
        writeComment.focus();
        e.preventDefault();
    }

    // ajax로 댓글을 삽입해봅시다!
    $.ajax({
        url : "/board/comment/insert",
        data : {"boardNo" : boardNo,
                "memberNo" : memberNo,
                "commentContent" : writeComment.value},
        type : "post",
        success : result=>{

            if(result>0){
                alert("댓글이 등록되었습니다");
                writeComment.value=""; // 작성한 댓글 없애주기
                selectCommentList(); // 다시 ajax로 불러옵시다!
            }else{
                alert("댓글 등록에 실패했습니다...");
            }
        },
        error : (req, status, error)=>{
            alert("댓글 등록 ajax 통신오류...ㅜㅠ");
            console.log("댓글 등록 ajax 통신오류...ㅜㅠ");
        }
    });
});


// 답글 달기 해보자!
// 답글 달기를 누르면 답글 다는 박스가 새로 생겨야 돼.
function showReply(parentNo, btn){

    // 답글 작성 중 다른 답글을 작성하고자 할 때
    // 임시로 하나 만들어준거야
    const temp = document.getElementsByClassName("comment-co-content")
    if(temp.length > 0){

        // 다른 답글에 다시 달래 했을 때 밑의 모든 자식들을 지워줄거야
        if(confirm("다른 답글을 작성 중입니다. 현재 답글에 작성하시겠습니까?")){
            temp[0].nextElementSibling.remove();
            temp[0].remove();
        }else{
            // 아니라면 그냥 함수를 종료 시켜줄거야
            return;
        }
    }
        // 답글을 작성할 부분들을 만들어 볼까요~?

        // textarea를 만들어볼게요~
        const textarea = document.createElement("textarea");
        textarea.classList.add("comment-co-content");

        // btn의 부모 요소 다음에 추가 해볼까요?
        btn.parentElement.after(textarea);

        // 버튼들을 감쌀 div태그를 만들어볼게요
        const btnArea = document.createElement("div");
        btnArea.classList.add("co-btn-area");

        // 답글 보내기 버튼~
        const sendCo  = document.createElement("button");
        sendCo.classList.add("send-co");
        sendCo.innerText = "답글 보내기";
        sendCo.setAttribute("onclick", "sendCo("+parentNo+", this)");

        // 답글 취소 버튼~
        const cancleCo = document.createElement("button");
        cancleCo.classList.add("cancle-co");
        cancleCo.innerText = "취소";
        cancleCo.setAttribute("onclick", "cancleCo(this)");

        // 버튼 공간에 버튼들을 넣어줄까요?
        btnArea.append(sendCo, cancleCo);

        // 버튼 공간을 textarea다음에 넣어줘요~
        textarea.after(btnArea);
}

// 답글 취소를 누르면 없어지게 만들어보아요~~
function cancleCo(btn){
    // 취소 버튼의 부모의 전 요소를 지워요
    btn.parentElement.previousElementSibling.remove();
    // 취소 버튼의 부모를 지워요
    btn.parentElement.remove();
}

// 답글을 보내봐요~
function sendCo(parentNo, btn){

    // textarea 값을 지정해줄까요?
    const textarea = btn.parentElement.previousElementSibling;

    // textarea의 값을 저장합니다.
    const commentContent = textarea.value;
    console.log(commentContent);

    if(commentContent.trim().length == 0){
        alert("답글이 작성되지 않았어요. 답글을 작성해주세요");
        commentContent.value="";
        commentContent.focus();
        return;
    }

    // ajax를 이용해서 답글을 등록해볼까요!
    $.ajax({
        url : "/board/comment/insert",
        data : {"boardNo" : boardNo,
                "memberNo" : memberNo,
                "commentContent" : commentContent,
                "commentParent" : parentNo},
        type : "post",
        success : result=>{
            if(result>0){
                alert("답글이 등록됐습니다.");
                selectCommentList();
            }else{
                alert("답글 등록 시류ㅐㅠㅠㅠㅜㅠㅜ");
            }
        },
        error : ()=>{
            alert("답글 ajax 통신 오류ㅠ");
        }
    });

}



// 댓글 수정 화면으로 바꿔 볼까요~?

// 수정 전 원래 모양을 저장합니다~
let beforeCommentRow; 

function updateComment(commentNo, btn){

    // 댓글 수정은 하나만 되야 하니까 임시로 만들어줘볼까?
    const temp = document.getElementsByClassName("update-textarea");

    if(temp.length > 0){
        if(confirm("다른 댓글을 수정 중입니다. 현재 댓글을 수정하시겠습니까?")){
            temp[0].parentElement.innerHTML = beforeCommentRow;
        }else{
            return;
        }
    }


    // 댓글 수정이 클릭 된 행
    const commentRow = btn.parentElement.parentElement;

    // 댓글 수정 시 원래 내용을 저장해볼까요?
    beforeCommentRow = commentRow.innerHTML;

    


}