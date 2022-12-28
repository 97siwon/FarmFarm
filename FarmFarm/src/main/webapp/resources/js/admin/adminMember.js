
// optimize: 전체 회원 정보 조회 함수

var numCount = 0;
var inputMemberId = null;

// cp를 받아 게시글 목록 조회
const selectMemberList = (cp) => {
    $.ajax({
        url: "/admin/selectMemberList",
        data: {"cp":cp, "authFilter": authFilter, "statFilter":statFilter},
        dataType: "JSON",
        type: "GET",
        success: (map) => {
            printMemberList(map.memberList, map.pagination);
        }, 
            error: () => {
            console.log("cp 받아 회원 정보 조회 실패");
        }
    });
}

// // cp를 받아 게시글 목록 조회
// const selectMemberListFiltering = () => {
//     $.ajax({
//         url: "/admin/selectMemberList",
//         data: {"cp":cp, "authFilter": authFilter, "statFilter":statFilter},
//         dataType: "JSON",
//         type: "GET",
//         success: (map) => {
//             printMemberList(map.memberList, map.pagination);
//         }, 
//             error: () => {
//             console.log("필터링하여 회원 정보 조회 실패");
//         }
//     });
// }
                



// 조회해온 회원 목록을 화면에 출력하는 함수
const printMemberList = (memberList, pagination) => {

    console.log("가져옴");

    // 이 위치 사수하기
    document.getElementById("tbody").innerHTML = "";
    document.getElementById("adminPaginationArea").innerHTML = "";

    const middleBoard = document.getElementById("middleBoard");
    
    const detailTable = document.getElementsByClassName("member-detail-table")[0];
    const historyTable = document.getElementsByClassName("member-history-table")[0];
    
    const adminPaginationArea = document.getElementById("adminPaginationArea");



    // 페이지네이션 박스
    const adminPagination = document.createElement('ul');
    adminPagination.classList.add('admin-pagination');

    adminPaginationArea.append(adminPagination);

    printPagination(adminPagination, pagination);

    
    for(let member of memberList){

                
        const tr = document.createElement("tr");
        tr.classList.add("member-select-row");
        tr.id = "memberSelectRow";


        inputMemberId = document.createElement("input");
        inputMemberId.value = member.memberId;
        inputMemberId.className = "input-member-id";
        inputMemberId.type = "hidden";
        inputMemberId.name = "memberId";

        
        // no
        const td1 = document.createElement("td");
        td1.classList.add("report-member-seq");

        numCount++;
        td1.innerText = numCount;


        // 회원번호
        const td2 = document.createElement("td");
        td2.innerText = member.memberNo;

        // 아이디
        const td3 = document.createElement("td");
        td3.innerText = member.memberId;


        // 닉네임
        const td4 = document.createElement("td");
        td4.innerText = member.memberNickname;

        // 주소
        const td5 = document.createElement("td");

        const temp = member.memberAddress;
        
        if(temp != null){
            const address = temp.substring(temp.indexOf(",,")+2, temp.lastIndexOf(",,"));
            td5.innerText = address;
        } else {
            td5.innerText = "-";
        }

        // 가입일
        const td6 = document.createElement("td");
        td6.innerText = member.signUpDate;

        // 판매자 등록
        const td7 = document.createElement("td");

        if(member.authority != null){

            if(member.authority == 0){
                td7.innerText = "미등록";
            }

            if(member.authority == 1){
                td7.innerText = "판매자";
            }

            if(member.authority == 3){
                td7.innerText = "인증 대기";
            }
        }


        // 상태
        const td8 = document.createElement("td");

        // if(member.reportPenalty != null & member.memberDelFl != null){
        if(member.memberDelFl != null){

            if(member.reportPenalty == 'N' || member.reportPenalty == null){
                td8.innerText = "활동중";
            }

            if(member.reportPenalty == 'N' && member.reportType != null){
                td8.innerText = "신고접수";
            }

            if(member.reportPenalty == 'Y'){
                td8.innerText = "정지";
            }

            if(member.memberDelFl == 'Y'){
                td8.innerText = "탈퇴"
            }
        }


        // 조립
        tr.append(td1, td2, td3, td4, td5, td6, td7, td8, inputMemberId);
        tbody.append(tr);


        
        //todo : 회원 상세 조회
        // 한 줄 클릭하면 상세창 뜨면서 정보 조회.
        tr.addEventListener("click", () => {

            middleBoard.style.display = "block";

            // 다시 클릭할 때 텍스트 비우기
            detailTable.innerText = "";
            historyTable.innerText = "";

            console.log("성공!");

            // const member = map.memberDetail;


            // 1)
            const detailTr1 = document.createElement("tr");
            
            // 프로필 이미지
            const memberImg = document.createElement("td");
            memberImg.classList.add("detail-profileImg");
            memberImg.id = "detailMemberImg";
            memberImg.rowSpan = "6";

            const tdImg = document.createElement("img");

            if(member.profileImg != null) {
                tdImg.setAttribute("src", member.profileImg);
            } else {
                tdImg.setAttribute("src", "/resources/images/myPage/profile/profileImg.png");
            }

            //회원번호
            const memberNo = document.createElement("td");
            memberNo.style.width = "90px";
            memberNo.classList.add("detail-bold");
            memberNo.innerText = "회원번호";

            const tdNo = document.createElement("td");
            tdNo.style.width = "120px";
            tdNo.innerText = member.memberNo;

            // 연락처
            const memberTel = document.createElement("td");
            memberTel.style.width = "90px";
            memberTel.classList.add("detail-bold");
            memberTel.innerText = "연락처";
            
            const tdTel = document.createElement("td");
            tdTel.style.width = "175px";
            tdTel.innerText = member.to;


            // 2)
            const detailTr2 = document.createElement("tr");

            // 아이디
            const memberId = document.createElement("td");
            memberId.classList.add("detail-bold");
            memberId.innerText = "아이디";

            const tdId = document.createElement("td");
            tdId.innerText = member.memberId;


            // 생년월일
            const memberBirth = document.createElement("td");
            memberBirth.classList.add("detail-bold");
            memberBirth.innerText = "생년월일";

            const tdBirth = document.createElement("td");
            tdBirth.innerText = member.memberBirth;


            // 3)
            const detailTr3 = document.createElement("tr");
            // 성명
            const memberName = document.createElement("td");
            memberName.classList.add("detail-bold");
            memberName.innerText = "성명";

            const tdName = document.createElement("td");
            tdName.innerText = member.memberName;

            // 판매자 인증
            const sellerAuth = document.createElement("td");
            sellerAuth.classList.add("detail-bold");
            sellerAuth.innerText = "판매자 인증";

            const tdAuth = document.createElement("td");

            if(member.authority != null){

                if(member.authority == 0){
                    tdAuth.innerText = "미등록";
                }

                if(member.authority == 1){
                    tdAuth.innerText = "판매자";
                }

                if(member.authority == 3){
                    tdAuth.innerText = "인증 대기";
                }
            }


            // 4)
            const detailTr4 = document.createElement("tr");
            
            // 닉네임
            const memberNickname = document.createElement("td");
            memberNickname.classList.add("detail-bold");
            memberNickname.innerText = "닉네임";

            const tdNickname = document.createElement("td");
            tdNickname.innerText = member.memberNickname;


            // 상태
            const memberStatus = document.createElement("td");
            memberStatus.classList.add("detail-bold");
            memberStatus.innerText = "상태";

            const tdStatus = document.createElement("td");

            if(member.memberDelFl != null){

                if(member.reportPenalty == 'N' || member.reportPenalty == null){
                    tdStatus.innerText = "활동중";
                }

                if(member.reportPenalty == 'N' && member.reportType != null){
                    tdStatus.innerText = "신고접수";
                }

                if(member.reportPenalty == 'Y'){
                    tdStatus.innerText = "정지";
                }

                if(member.memberDelFl == 'Y'){
                    tdStatus.innerText = "탈퇴"
                }
            }


            // 5)
            const detailTr5 = document.createElement("tr");

            // 가입일
            const signUpDate = document.createElement("td");
            signUpDate.classList.add("detail-bold");
            signUpDate.innerText = "가입일";

            const tdDate = document.createElement("td");
            tdDate.innerText = member.signUpDate;

            // 신고 사유
            // const reason = document.createElement("td");
            // reason.classList.add("detail-bold");

            // if(tdStatus.innerText =="신고접수" || tdStatus.innerText == "정지" || tdStatus.innerText == "탈퇴"){
            //     reason.innerText = "신고 사유";
            // } else {
            //     reason.innerText = "";
            // }


            // const tdReason = document.createElement("td");

            // if(member.reportReason != null){
            //     tdReason.innerText = member.reportReason;
            // } else {
            //     tdReason.innerText = "";
            // }

            //6)
            const detailTr6 = document.createElement("tr");

            // 주소
            const address = document.createElement("td");
            address.classList.add("detail-bold");
            address.innerText = "주소";

            const tdAddress = document.createElement("td");
            tdAddress.colSpan = "3";

            const add = member.memberAddress.replaceAll(',,', ' ');
            tdAddress.innerText = add;


            // 조립
            memberImg.append(tdImg);
            detailTr1.append(memberImg, memberNo, tdNo, memberTel, tdTel);
            detailTr2.append(memberId, tdId, memberBirth, tdBirth);
            detailTr3.append(memberName, tdName, sellerAuth, tdAuth);
            detailTr4.append(memberNickname, tdNickname, memberStatus, tdStatus);
            detailTr5.append(signUpDate, tdDate);
            // detailTr5.append(signUpDate, tdDate, reason, tdReason);
            detailTr6.append(address, tdAddress);
            detailTable.append(detailTr1, detailTr2, detailTr3, detailTr4, detailTr5, detailTr6);


            // todo: 계정 상태
            // 1)
            const tr1 = document.createElement("tr");
            tr1.classList.add("member-history-row");

            const th1 = document.createElement("th");
            th1.style.width = "160px";
            th1.innerText = "일자";

            const th2 = document.createElement("th");
            th2.style.width = "130px";
            th2.innerText = "상태";

            const th3 = document.createElement("th");
            th3.style.width = "150px";
            th3.innerText = "비고";


            // 2) 가입
            const tr2 = document.createElement("tr");
            const td4 = document.createElement("td");
            td4.innerText = member.signUpDate;

            const td5 = document.createElement("td");
            td5.innerText = "가입";

            const td6 = document.createElement("td");
            td6.innerText = "";


            // 3) 신고 처리 내역

            const trReport = document.createElement("tr");
            const tdReportDate = document.createElement("td");
            const tdReport = document.createElement("td");
            const tdReportReason = document.createElement("td");

            if(member.memberDelFl == 'N'){
                if(member.reportPenalty == 'Y'){
                    if(member.processDate != null){
                        tdReportDate.innerText = member.processDate;
                        tdReport.innerText = "정지"
                    }
                }
            }

            if(member.memberDelFl == 'Y'){
                if(member.reportPenalty == 'N'){
                    tdReport.innerText = "탈퇴";
                }

                if(member.reportPenalty == 'Y'){
                    tdReportDate.innerText = member.processDate;
                    tdReport.innerText = "강제 탈퇴";
                }
            }

            if(member.processDate != null){
                tdReportReason.innerText = member.processContent;
            } else {
                tdReportReason.innerText = "";
            }
                
            
            // 조립
            tr1.append(th1, th2, th3);
            tr2.append(td4, td5, td6);
            trReport.append(tdReportDate, tdReport, tdReportReason);

            historyTable.append(tr1, tr2, trReport)

        })

    }
}





/* 페이지 박스를 만드는 함수 */
const makePageBox = (elementName, inputHtml, inputId, className) => {
    elementName.innerHTML = inputHtml;
    elementName.id = inputId;
    elementName.classList.add(className);
}


// todo: 페이지네이션 박스 화면에 출력
const printPagination = (adminPagination, pagination) => {


    // 이전 페이지
    const firstPage = document.createElement('li');
    const prevPage = document.createElement('li');

    makePageBox(firstPage, '<i class="fa-solid fa-angles-left"></i>', 1, 'page-box');
    makePageBox(prevPage, '<i class="fa-solid fa-angle-left"></i>', pagination.prevPage, 'page-box');

    adminPagination.append(firstPage, prevPage);

    // 번호 페이지 제작
    for(let i=pagination.startPage; i <= pagination.endPage; i++){

        const numPage = document.createElement('li');

        if(i == pagination.currentPage){
            makePageBox(numPage, i, i, 'current-page-box');
        } else {
            makePageBox(numPage, i, i, 'page-box');
        }

        adminPagination.append(numPage);

        selectMemberListEvent(numPage, i);
    }


    // 이후 페이지 제작
    const nextPage = document.createElement('li');
    const maxPage = document.createElement('li');
    makePageBox(nextPage, '<i class="fa-solid fa-angle-right"></i>', pagination.nextPage, 'page-box');
    makePageBox(maxPage, '<i class="fa-solid fa-angles-right"></i>', pagination.maxPage, 'page-box');

    adminPagination.append(nextPage, maxPage);

    selectMemberListEvent(firstPage, 1);
    selectMemberListEvent(prevPage, pagination.prevPage);
    selectMemberListEvent(nextPage, pagination.nextPage);
    selectMemberListEvent(maxPage, pagination.maxPage);
}


//todo: 필터 드롭다운 메뉴
//fix: 페이지네이션 이후에 수정하기! 드롭다운 메뉴 동시에 열림..
const dropBtn1 = document.getElementById("dropBtn1");
const dropBtn2 = document.getElementById("dropBtn2");
const dropMenu1 = document.getElementById("dropMenu1");
const dropMenu2 = document.getElementById("dropMenu2");

dropBtn1.addEventListener("click", () => {
    dropMenu1.classList.toggle("toggle");
})

dropBtn2.addEventListener("click", () => {
    dropMenu2.classList.toggle("toggle");
})

const dropUl1 = document.getElementById("dropUl1");
const dropUl2 = document.getElementById("dropUl2");

dropUl1.addEventListener("click", () => {
    dropMenu1.classList.toggle("toggle");
})

dropUl2.addEventListener("click", () => {
    dropMenu2.classList.toggle("toggle");
})


// HTML 문서가 모두 읽어진 후에!!!
// 바로 selectMemberList() 호출
// 반대로하면 읽지 못함.
// todo: 전체 회원정보 조회
// 첫 페이지 불러오기
document.addEventListener("DOMContentLoaded", () => {
    selectMemberList();
    document.getElementsByTagName("body").scrollTop!=0;
});



// 2페이지 이후에 불러오기
/* 페이지네이션 박스에 클릭 이벤트 추가 */
const selectMemberListEvent = (element, cp) => {
    element.addEventListener('click', () => {
        numCount = (cp-1)*15;
        selectMemberList(cp);
    });
}



//todo: 필터 옵션 별로 조회 + pagination
//todo: 필터링하여 조회 (판매자인증 authFilter / 상태 statFilter)
const authFiltering = document.getElementsByClassName("authFilter");
const statFiltering = document.getElementsByClassName("statFilter");


// id에서 앞자리 잘라주기 a1 -> 1
// authFilter, statFilter에 넣어서 controller에 보내주기 위해.
const getFilterNum = (string) => {
    return string.substring(1);
}


// 판매자인증 필터 authFilter
// 0 전체, 1 미등록, 2 판매자, 3 인증대기
// for(auth of authFiltering){
//     auth.addEventListener("click", ()=>{
//         console.log(auth);
//         let authFl = getFilterNum(auth.id);
//         authFilter = authFl;  // authFilter : jsp에서 전역변수로 선언함.
//         selectMemberList();
//         console.log(authFilter);
//     })
// }
const dropBtn1Text = document.getElementById("dropBtn1Text");
const dropBtn2Text = document.getElementById("dropBtn2Text")

document.getElementById("a0").addEventListener("click", ()=>{
    numCount = (cp-1)*15;
    let authFl = getFilterNum("a0");
    authFilter = authFl;  // authFilter : jsp에서 전역변수로 선언함.
    selectMemberList();
    dropBtn1Text.innerText = "판매자 등록";
})

document.getElementById("a1").addEventListener("click", ()=>{
    numCount = (cp-1)*15;
    let authFl = getFilterNum("a1");
    authFilter = authFl;  // authFilter : jsp에서 전역변수로 선언함.
    selectMemberList();
    dropBtn1Text.innerText = "미등록";
})

document.getElementById("a2").addEventListener("click", ()=>{
    numCount = (cp-1)*15;
    let authFl = getFilterNum("a2");
    authFilter = authFl;  // authFilter : jsp에서 전역변수로 선언함.
    selectMemberList();
    dropBtn1Text.innerText = "판매자";
})

document.getElementById("a3").addEventListener("click", ()=>{
    numCount = (cp-1)*15;
    let authFl = getFilterNum("a3");
    authFilter = authFl;  // authFilter : jsp에서 전역변수로 선언함.
    selectMemberList();
    dropBtn1Text.innerText = "인증 대기";
})





// 상태 필터 ststFilter
// 0 전체, 1 활동중, 2 신고 접수, 3 정지, 4 탈퇴
// for(stat of statFiltering){
//     stat.addEventListener("click", () => {
//         let statFl = getFilterNum(stat.id);
//         statFilter = statFl;
//         selectMemberList();
//     })
// }


document.getElementById("s0").addEventListener("click", ()=>{
    numCount = (cp-1)*15;
    let statFl = getFilterNum("s0");
    statFilter = statFl;  // authFilter : jsp에서 전역변수로 선언함.
    selectMemberList();
    dropBtn2Text.innerText = "상태";
})
document.getElementById("s1").addEventListener("click", ()=>{
    numCount = (cp-1)*15;
    let statFl = getFilterNum("s1");
    statFilter = statFl;  // authFilter : jsp에서 전역변수로 선언함.
    selectMemberList();
    dropBtn2Text.innerText = "활동중";
})
document.getElementById("s2").addEventListener("click", ()=>{
    numCount = (cp-1)*15;
    let statFl = getFilterNum("s2");
    statFilter = statFl;  // authFilter : jsp에서 전역변수로 선언함.
    selectMemberList();
    dropBtn2Text.innerText = "신고 접수";
})
document.getElementById("s3").addEventListener("click", ()=>{
    numCount = (cp-1)*15;
    let statFl = getFilterNum("s3");
    statFilter = statFl;  // authFilter : jsp에서 전역변수로 선언함.
    selectMemberList();
    dropBtn2Text.innerText = "정지";
})
document.getElementById("s4").addEventListener("click", ()=>{
    numCount = (cp-1)*15;
    let statFl = getFilterNum("s4");
    statFilter = statFl;  // authFilter : jsp에서 전역변수로 선언함.
    selectMemberList();
    dropBtn2Text.innerText = "탈퇴";
})







