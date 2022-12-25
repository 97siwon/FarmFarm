/* Axios, WebSocket */

// 요청 생성하기
// 요청 보내기
// axios.method('요청 주소', {보낼 data
//              })
//              .then(function (response) {

//              })
//              .catch(function (error) {

//              })

// 내 채팅방 목록 가져오기
window.addEventListener("DOMContentLoaded", ()=>{
    // 내 채팅방 목록 가져오기
    axios.post('/chat/chatRoomList')
        .then(function (response) {
            const chatPreviewArea = document.querySelector('.chat-preview-area');

            let chatRoomList = response.data.chatRoomList;

            for(let chatRoomInfo of chatRoomList) {
                chatPreviewArea.append(makeChatPreviewBox(chatRoomInfo));
            }

        }).catch(function (error) { 
            console.log(error);
            // location.href = '/error';
        });

    
})

window.addEventListener('load', ()=>{
    // 채팅방 미리보기에 이벤트 부여
    // const chatPreviewBoxes = document.getElementsByClassName('chat-preview-box');

    // console.log(chatPreviewBoxes);

    // chatPreviewBoxes[0].addEventListener('click', ()=>{
    //     console.log('ㅇㅇ')
    // })

})

/* 요소에 클래스, 텍스트를 넣는 함수 */
const packUpElement = (elementName, elementClass, elementContent) => {

    elementName.classList.add(elementClass);

    if (elementContent != null) { // -1을 넣으면 안넣음
        elementName.innerHTML = elementContent;
    }

    return elementName;
}

/* 채팅방 목록을 불러오는 함수 */
const makeChatPreviewBox = (chatRoomInfo) => {
    // 재료 준비
    const chatPreviewBox = document.createElement('div');
    const profileImg = document.createElement('div');
    const boxLabel = document.createElement('div');
    const memberNickname = document.createElement('div');
    const lastChatTime = document.createElement('div');
    const lastChatContent = document.createElement('div');

    // 방번호 넣기
    chatPreviewBox.id = chatRoomInfo.roomNo;

    // 데이터 넣기
    packUpElement(chatPreviewBox, 'chat-preview-box', null);
    
    if(chatRoomInfo.profileImg == undefined ) {
        packUpElement(profileImg, 'profile-img', "<img src='/resources/images/member/user.png'>");
    } else {
        packUpElement(profileImg, 'profile-img', chatRoomInfo.profileImg2);
    }
    
    packUpElement(boxLabel, 'box-label', null);
    
    packUpElement(memberNickname, 'member-nickname', chatRoomInfo.memberNickname2);
    
    if(chatRoomInfo.lastChatTime == undefined) {
        packUpElement(lastChatTime, 'last-chat-time', '');
    } else {
        packUpElement(lastChatTime, 'last-chat-time', chatRoomInfo.lastChatTime);
    }

    if(chatRoomInfo.lastChatContent == undefined) {
        packUpElement(lastChatContent, 'last-chat-content', '대화 내용이 없습니다.');
    } else {
        packUpElement(lastChatContent, 'last-chat-content', chatRoomInfo.lastChatContent);
    }

    // 포장하기
    boxLabel.append(memberNickname, lastChatTime);
    chatPreviewBox.append(profileImg, boxLabel, lastChatContent);

    chatPreviewBox.addEventListener('click', ()=>{
        chatPreviewBoxEvent(chatPreviewBox);
    })

    return chatPreviewBox;
}

/* 채팅방 목록에 이벤트 부여 */
const chatPreviewBoxEvent = (chatPreviewBox) => {
    console.log('가져올게 잠깐만 ~ ')
    document.getElementById('roomBodyBlinder').style.display='none';

    const roomNo = chatPreviewBox.id;
    const profileImg2 = chatPreviewBox.children[0].innerHTML;
    const memberNickname2 = chatPreviewBox.children[1].children[0].innerText;

    // 채팅 목록 가져오기
    axios.post('/chat/' + roomNo)
        .then(function (response) {
            // 내 번호
            let myMemberNo = response.data.myMemberNo;

            // 채팅 내역
            let chatHistory = response.data.chatHistory

            // 채팅방 만들기
            makeChatRoom(myMemberNo, chatHistory, profileImg2, memberNickname2);

        }).catch(function (error) {
            console.log(error);
            // location.href = '/error';
        });
}

/* 채팅방을 만드는 함수 */
const makeChatRoom = (myMemberNo, chatHistory, profileImg2, memberNickname2) => {

    // 라벨 영역
    const postImg = document.getElementById('postImg');
    const postTitle = document.getElementById('postTitle');
    
    // 읽기 영역
    const readingArea = document.getElementById('readingArea');

    // 읽기 영역 비우기
    readingArea.innerHTML = '';

    // 채팅 메세지 넣기
    for(let chat of chatHistory) {
        if(chat.sendMemberNo == myMemberNo) { // 보낸 메세지인 경우

            const sentChat = document.createElement('div');
            const sentBubble = document.createElement('div');
            const sentBubbleTail = document.createElement('div');

            packUpElement(sentChat, 'sent-chat', null );
            packUpElement(sentBubble, 'sent-bubble', chat.chatContent);
            packUpElement(sentBubbleTail, 'sent-bubble-tail', null);

            sentChat.append(sentBubble, sentBubbleTail);

            readingArea.append(sentChat)

        } else { // 수신 메세지인 경우

            const receivedChat = document.createElement('div');
            const senderProfileImg = document.createElement('div');
            const senderName = document.createElement('div');
            const receivedBubbleTail = document.createElement('div');
            const receivedBubble = document.createElement('div');

            packUpElement(receivedChat, 'received-chat', null);
            packUpElement(senderProfileImg, 'sender-profile-img', profileImg2);
            packUpElement(senderName, 'sender-name', memberNickname2);
            packUpElement(receivedBubbleTail, 'received-bubble-tail', null);
            packUpElement(receivedBubble, 'received-bubble', chat.chatContent);

            receivedChat.append(senderProfileImg, senderName, receivedBubbleTail, receivedBubble);

            readingArea.append(receivedChat);
        }
    }
}