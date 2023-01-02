/* 

<가이드라인>


--------------------------------------- 유형 코드 -----------------------------------------
알림 유형
- 채팅(101)
- 채팅 리마인더(102)

- 게시글에 댓글(201)
- 댓글에 대댓글(202)

- 상품 주문 완료(301)
- 구매 확정 요청(302)
- 후기 요청(303)

- 문의 답변(401)

- 신고(501)

---------------------------------------  아이콘 -------------------------------------------

채팅 리마인더 : <i class="fa-solid fa-message"></i>      
배송 알림 : <i class="fa-solid fa-box"></i>
댓글 : <i class="fa-solid fa-comment"></i>
대댓글 : <i class="fa-solid fa-comments"></i>
new 댓글 : <i class="fa-solid fa-comment-dots"></i>
주문 알림 : <i class="fa-solid fa-envelope-open-text"></i>
후기 요청 : <i class="fa-solid fa-pen"></i>
신고 : <i class="fa-solid fa-circle-exclamation"></i>

------------------------------------------ 예시 ------------------------------------------

<div class="notify-box">
    <div class="notify-icon">
        <i class="fa-solid fa-box"></i>
    </div>
    <div class="notify-main">
        <div class="notify-content">
            고구마맛 감자채볶음
        </div>
        <div class="notify-title">
            상품을 받으셨나요?<br>구매 확정 버튼을 눌러주시면 판매자에게 도움이 됩니다!
        </div>
    </div>
    <div class="notify-date">
        2022-11-11
    </div>
</div>

*/

window.addEventListener('DOMContentLoaded', ()=>{
    // 페이지가 이동했을 때, 목록을 요청함
    selectNotifyList();
})




/* ---------------------------------------------------- 함수 목록 --------------------------------------------------- */

/* 요소에 클래스와 내용을 세팅하는 함수 */
const packupElement = (element, className, elementContent) => {
    element.classList.add(className); // 클래스 이름 지정
    if(elementContent != null) { // 내용이 null이 아닌 경우
        element.innerHTML = elementContent; // 내용을 집어넣음
    }
}

/* 내 알림 목록을 요청하는 함수 */
const selectNotifyList = () => {
    axios.post('/notify/center/select'
        ).then( function(response){
            
            // 1. 응답에서 알림 목록 꺼내기
            const notifyList = response.data.notifyList;

            // 2. 응답을 넣을 알림 목록 비우고
            const notifyViewArea = document.querySelector('.notify-view-area');
            notifyViewArea.innerHTML = '';

            // 3. 비어있을 때에만 출력할 default 요소 추가
            const notifyEmpty = document.createElement('div');
            packupElement(notifyEmpty, 'notify-empty', '알림이 없어요~!')
            notifyViewArea.append(notifyEmpty);

            console.log(notifyList);

            // 4-A. 응답이 있을 때에만 알림 목록 생성 구문을 실행하기
            if(notifyList.length > 0){
                
                // 5. 받아온 목록에서 요소 추가
                for(let notify of notifyList) {

                    // 2-1. 사용할 요소를 준비
                    const notifyBox = document.createElement("a");        // 알림 목록 하나의 최상위 부모
                    const notifyIcon = document.createElement("div");       // 알림 아이콘
                    const notifyMain = document.createElement("div");       // 알림 제목과 내용의 부모
                    const notifyContent = document.createElement("div");    // 알림 내용
                    const notifyTitle = document.createElement("div");      // 알림 제목
                    const notifyDate = document.createElement("div");       // 알림 날짜
    
                    // 2-2. 요소에 클래스, 내용을 세팅하는 함수
                    // (1) 알림 목록 하나의 최상위 부모를 만들고 링크 부여
                    packupElement(notifyBox, 'notify-box', null);
                    notifyBox.setAttribute('href', notify.quickLink);

                    // (2) 정렬을 위해서 class값을 추가 + (3) 알림 아이콘
                    let icon;

                    switch(notify.notifyTypeNo) {
                        case 201: { // 댓글
                            packupElement(notifyBox, 'board', null);
                            icon = '<i class="fa-solid fa-comment-dots"></i>';
                            break; 
                        }       
                        case 202: { // 답글
                            packupElement(notifyBox, 'board', null);
                            icon = '<i class="fa-solid fa-comment-dots"></i>'; 
                            break;
                        }            
                        case 301: { // 주문 완료
                            packupElement(notifyBox, 'shop', null);
                            icon = '<i class="fa-solid fa-envelope-open-text"></i>'; 
                            break;   
                        }
                        case 302: { // 구매 확정 요청
                            packupElement(notifyBox, 'shop', null);
                            icon = '<i class="fa-solid fa-box"></i>';
                             break;                  
                        }
                        case 303: { // 후기 요청
                            packupElement(notifyBox, 'shop', null);
                            icon = '<i class="fa-solid fa-pen"></i>'; 
                            break;                  
                        }
                        case 401: { // 문의 답변
                            packupElement(notifyBox, 'inquiry', null);
                            icon = '<i class="fa-solid fa-circle-exclamation"></i>';
                            break;   
                        }
                    }

                    packupElement(notifyIcon, 'notify-icon', icon);

                    // (4) 내용, 제목, 날짜가 들어가는 notify-main
                    packupElement(notifyMain, 'notify-main', null);

                    // (5) 내용
                    packupElement(notifyContent, 'notify-content', notify.notifyContent);

                    // (6) 제목
                    packupElement(notifyTitle, 'notify-title', notify.notifyTitle);

                    // (7) 날짜
                    packupElement(notifyDate, 'notify-date', notify.notifyDate);

                    // 6. 준비된 요소를 포장
                    notifyMain.append(notifyContent, notifyTitle);
                    notifyBox.append(notifyIcon, notifyMain, notifyDate);

                    // 7. 목록 페이지에 세팅
                    notifyViewArea.append(notifyBox);

                }


            } else { // 만약 응답이 비어있는 경우, 비어있다는 문구를 띄움
                notifyEmpty.style.display='flex';
            }

        }).catch(function(error){
            
            console.log('알림 목록 요청에 실패하였습니다.');
            console.log(error);

        }); 
}

/* 알림 카테고리 필터링 */

/* 라디오 버튼을 눌렀을 때 특정한 요소만 남기는 함수 */
const typeFilter = (option) => {
    const typeList = document.getElementsByClassName('notify-box');

    let boxExist = false;

    document.querySelector('.notify-empty').style.display="none";

    for(let type of typeList){
        if(!type.classList.contains(option)){
            type.style.display="none";
            document.querySelector('.notify-empty').style.display="flex";
        } else {
            type.style.display="flex";
            boxExist = true;
        }
    }

    // 만약 요소가 하나도 없으면...
    if(!boxExist){
        document.querySelector('.notify-empty').style.display="flex";
    }
}

/* 필터링을 해제하는 함수 */
const typeFilterRemove = () => {
    // 필터로 사용되는 타입 리스트
    const typeList = document.getElementsByClassName('notify-box');

    // 알림이 존재하는지 점검하는 변수
    let boxExist = false;

    // empty 박스 비우기
    document.querySelector('.notify-empty').style.display="none";

    for(let type of typeList){
        type.style.display="flex";
        boxExist = true;
    }

    // 만약 요소가 하나도 없으면...
    if(!boxExist){
        document.querySelector('.notify-empty').style.display="flex";
    }
}

/* 필터 버튼에 필터링 부여 */
document.getElementById('categoryAll').addEventListener('click', (e)=>{
    if(e.target.checked) typeFilterRemove();
})

document.getElementById('categoryShop').addEventListener('click', (e)=>{
    if(e.target.checked) typeFilter('shop');
})

document.getElementById('categoryBoard').addEventListener('click', (e)=>{
    if(e.target.checked) typeFilter('board');
})

document.getElementById('categoryInquiry').addEventListener('click', (e)=>{
    if(e.target.checked) typeFilter('inquiry');
})