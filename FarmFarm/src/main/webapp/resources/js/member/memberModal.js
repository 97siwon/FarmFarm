(()=>{
  const boardWriter = document.getElementsByClassName("board-writer");

  if(boardWriter.length > 0){ 

      // Modal 관련 요소 얻어오기
      const modal = document.querySelector(".modal");
      const modalClose = document.getElementById("modal-close");
      const modalImage = document.getElementById("modal-text");

      for(let th of boardWriter){
          th.addEventListener("click", () => {
              modal.classList.toggle("show");
              modalImage.setAttribute("src", th.getAttribute("src"));
              selectMember(th.id);
          });
      }
      
      // x버튼 동작
      modalClose.addEventListener("click", () => {
          
          // hide 클래스를 추가해서 0.5초 동안 투명해지는 애니메이션 수행
          modal.classList.toggle("hide");

          // 0.5초 후에 show, hide 클래스를 모두 제거
          setTimeout(() => {
              modal.classList.remove("show", "hide");
          }, 500);

      });

  }

})();

const modalImgarea = document.getElementById("modalImgarea");
const img = document.createElement("img");
img.classList.add("image");
modalImgarea.append(img);

const memberNickname = document.getElementById("memberNickname");
const modalSignUpDate = document.getElementById("modalSignUpDate");

const selectMember = (memberNo) => {
  $.ajax({
    url : "/board/member/" + memberNo,
    dataType : "JSON",
    success : (member)=>{
      console.log(member.memberNickname);
      console.log("ajax 통신");

      if(member.profileImage !=null) {
        img.setAttribute("src", member.profileImage);
        modalImgarea;
      }else {
        img.setAttribute("src", "/resources/images/myPage/profile/profileImg.png");
        modalImgarea;
      };

      memberNickname.innerText = member.memberNickname;
      modalSignUpDate.innerText = member.signUpDate;

    }, 
    error : ()=>{
      console.log("ajax 통신 실패");
    }
  })

}