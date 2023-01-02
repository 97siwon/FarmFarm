const selectOne = document.getElementsByClassName("select-one");
const checkIcon = document.querySelectorAll("[name='checkIcon']");

const selectAll = document.querySelector("[name='selectAll']");
const checkAll = document.querySelector("[name='checkAll']");
let countCheck = selectOne.length;

// 수량 변경
const minusBtn = document.getElementsByClassName("minus-btn");
const plusBtn = document.getElementsByClassName("plus-btn");
const stock = document.getElementsByName("stock");
const productAmount = document.getElementsByClassName("product-amount");
const productTotalPrice = document.getElementsByClassName("product-total-price");

const totalPrice = document.getElementById("totalPrice");
const orderPrice = document.getElementById("orderPrice");
const postPrice = document.getElementById("postPrice");

// 체크박스 하나 체크할 때
for(let i=0; i<selectOne.length; i++){
  
  let productPrice = 0;

  selectOne[i].addEventListener("change", (e) => {

    if(!e.target.checked){
      checkIcon[i].classList.remove("fa-solid");
      checkIcon[i].classList.add("fa-regular");
      e.target.checked = false;
      countCheck = countCheck-1;
      
      // 전체선택 해제
      selectAll.checked=false;
      checkAll.classList.remove("fa-solid");
      checkAll.classList.add("fa-regular");

      productPrice 
      = productAmount[i].value * Number(productTotalPrice[i].id.replaceAll(',', ''));

      minusTotal(productPrice);

      // 체크된 목록이 1개 아래면 배송미 없애기
      const selectChecked = document.querySelectorAll("[name='selectOne']:checked");
      
      if(selectChecked.length == 0){
        postPrice.innerText = 0;
        orderPrice.innerText = 0;
      }


    } else {
      checkIcon[i].classList.remove("fa-regular"); 
      checkIcon[i].classList.add("fa-solid");
      e.target.checked = true;
      countCheck = countCheck+1;

      productPrice 
      = productAmount[i].value * Number(productTotalPrice[i].id.replaceAll(',', ''));
      
      plusTotal(productPrice);

      // 선택된 체크와 전체 항목 수가 일치할 경우
      const selectChecked = document.querySelectorAll("[name='selectOne']:checked");
      
      if(selectOne.length==selectChecked.length){
        selectAll.checked=true;
        checkAll.classList.remove("fa-regular"); 
        checkAll.classList.add("fa-solid");
        
      }else{
          selectAll.checked=false;
          checkAll.classList.remove("fa-solid");
          checkAll.classList.add("fa-regular");
      }

      if(selectChecked.length == 1){
        postPrice.innerText = (3000).toLocaleString();
      }

    }
    document.querySelector(".count-check").innerText = countCheck;
  })

}

// 전체선택 체크박스
selectAll.addEventListener("change", (e) => {

  // 체크 해제 시
  if(!e.target.checked){
    checkAll.classList.remove("fa-solid");
    checkAll.classList.add("fa-regular");
    countCheck = 0;
    for(let select of selectOne) {
      select.checked=false;
    }
    for(let checkbox of checkIcon){
      checkbox.classList.remove("fa-solid");
      checkbox.classList.add("fa-regular");
    }

    totalPrice.innerText = 0;
    orderPrice.innerText = 0;
    postPrice.innerText = 0;

  } else {
    countCheck = selectOne.length;
    checkAll.classList.remove("fa-regular"); 
    checkAll.classList.add("fa-solid");

    for(let select of selectOne) {
      select.checked=true;
    }
    for(let checkbox of checkIcon){
      checkbox.classList.remove("fa-regular"); 
      checkbox.classList.add("fa-solid");
    }

    sumTotal();
    postPrice.innerText = "3,000";

  }
  document.querySelector(".count-check").innerText = countCheck;
})


// 수량 감소
for(let i=0; i<minusBtn.length; i++){
  minusBtn[i].addEventListener("click", (e) => {
    
    let productNo = document.getElementsByClassName("product-item")[i].id;
    stock[i].innerText="";

    if(Number(productAmount[i].value)>1){

      $.ajax({
        url: "/minusCart",
        data: {"productNo" : productNo,
              "memberNo" : memberNo},
        type: "GET",
        success: (result)=>{
          if(result>0){
            productAmount[i].value = Number(productAmount[i].value) - 1;
            productTotalPrice[i].innerText 
            = Number(productTotalPrice[i].innerText.replaceAll(',', ''))
            - Number(productTotalPrice[i].id.replaceAll(',', ''));

            productTotalPrice[i].innerText 
            = Number(productTotalPrice[i].innerText ).toLocaleString();
            
            if(selectOne[i].checked){
              sumTotal();
            }else{
              
            }
          }
        },
        error: ()=>{
          console.log("장바구니 수량 감소 실패");
        }
      })
    }
  })
}

// 수량 증가
for(let i=0; i<plusBtn.length; i++){
  plusBtn[i].addEventListener("click", (e) => {
    
    let productNo = document.getElementsByClassName("product-item")[i].id;
    
    if(Number(productAmount[i].value)<Number(stock[i].id)){
      $.ajax({
        url: "/plusCart",
        data: {"productNo" : productNo,
              "memberNo" : memberNo},
        type: "GET",
        success: (result)=>{
          if(result>0){
      
            productAmount[i].value = Number(productAmount[i].value) + 1;
            productTotalPrice[i].innerText 
            = Number(productTotalPrice[i].innerText.replaceAll(',', ''))
            + Number(productTotalPrice[i].id.replaceAll(',', ''));
            
            productTotalPrice[i].innerText 
            = Number(productTotalPrice[i].innerText ).toLocaleString();
            if(selectOne[i].checked){
              sumTotal();
            }else{

            }
          }
          
        },
        error: ()=>{
          console.log("장바구니 수량 증가 실패");
        }
      })
    }else{
      stock[i].innerText="* 해당 상품의 재고량을 초과할 수 없습니다.";
    }
  })
}





const sumTotal = ()=> {
  let temp = 0;

  for(let i=0; i<productTotalPrice.length; i++){
    productPrice = Number(productTotalPrice[i].id.replaceAll(',', ''));

    temp = temp + productPrice*productAmount[i].value;
  }

  totalPrice.innerText = Number(temp).toLocaleString();
  orderPrice.innerText = Number(temp+3000).toLocaleString();
}

const minusTotal = (productPrice)=>{
  temp = Number(totalPrice.innerText.replaceAll(',', '')) - productPrice;

  const selectChecked = document.querySelectorAll("[name='selectOne']:checked");

  
  totalPrice.innerText = temp.toLocaleString();
  orderPrice.innerText = (temp+3000).toLocaleString();
}

const plusTotal = (productPrice)=>{
  temp = Number(totalPrice.innerText.replaceAll(',', '')) + productPrice;

  totalPrice.innerText = temp.toLocaleString();
  orderPrice.innerText = (temp+3000).toLocaleString();
}


(()=>{
  sumTotal();
})();


const cancelBtn = document.getElementsByClassName("cancel-item");
for(let i=0; i<cancelBtn.length; i++){
  cancelBtn[i].addEventListener("click", ()=>{
    let productNo = document.getElementsByClassName("product-item")[i].id;
    deleteCartConfirmOpen();

    document.getElementById('deleteCartConfirmBtn').addEventListener('click', function () {
    
      $.ajax({
        url: "/deleteCart",
        data: {"productNo" : productNo,
              "memberNo" : memberNo},
        type: "GET",
        success: (result)=>{
          if(result>0){
            setTimeout(() => {
              window.location.reload();
            }, '200');
            console.log("삭제완료");
          }
        },
        error: ()=>{
          console.log("장바구니 삭제 실패");
        }
      })
    })


  })
}

// 장바구니 삭제 하시겠습니까? confirm
const deleteCartConfirmOpen = () => {
  const deleteCartConfirm = document.getElementById('deleteCartConfirm');
  displayFlex(deleteCartConfirm);
};

// 장바구니 삭제하시겠습니까? confirm 닫기
if (document.getElementById('deleteCartCalcelBtn') != undefined) {

  document.getElementById('deleteCartCalcelBtn').addEventListener('click', function () {
    const deleteCartConfirm = document.getElementById('deleteCartConfirm');
    displayNone(deleteCartConfirm);
  })

  
};
