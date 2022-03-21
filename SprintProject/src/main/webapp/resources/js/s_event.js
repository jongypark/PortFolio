
//1. hovered 이벤트  마우스가 떠났을때도 흰색이 남아있게 하는것 
//add hovered class in selected list item
//hovered 라는 것은 hover이벤트가 생기고 난뒤라는 네이밍? 
// 네이밍 그대로 hover이벤트시 배경이 생기는데 이 배경이 마우스가 떠나도(hover끝나도) 남아있게 하기 
let list = document.querySelectorAll('.seller-navigation li');

function activeLink( ){
    // 기존에 있던 hovered를 지우고 (흰배경이 남아있음 안된다. )
    list.forEach( function(item) { item.classList.remove('hovered') });
    //새롭게 이벤트가 발생한 곳(마우스가 떠난곳)에 hovered를 넣어서 흰배경이 남아있게 하기 
    this.classList.add('hovered')
};

list.forEach( function(item){ item.addEventListener('mouseover' , activeLink) });

//2. 햄버거 버튼 이벤트 , 버튼 누를시 navigation과 main에 active 클래스가 생기게 하기 
   let toggle = document.querySelector('.seller-toggle');
    let navigation = document.querySelector('.seller-navigation');
    let main = document.querySelector('.seller-main');

    // toggle.onclick = function(){
    //     navigation.classList.toggle('active');
    // }

    toggle.addEventListener('click' , function () {
      
        navigation.classList.toggle('active');
        main.classList.toggle('active');
    });
