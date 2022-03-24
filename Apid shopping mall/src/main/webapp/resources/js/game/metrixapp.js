/**
 * 
 */



// 배경 모양들 떨어지는거 .. 
falls = () => {
    let fall_count = 50

    let container = document.querySelector('.wrapper')

    for (let i = 0; i < fall_count; i++) {
        
        // 랜덤 이미지 선택
        let img_index = Math.floor(Math.random() * 6) + 1

        let x = Math.floor(Math.random() * window.innerWidth)
        let y = Math.floor(Math.random() * window.innerHeight)

        // 랜덤 사이즈
        let size = Math.random() * 40
        //랜덤 떨어지는 속도
        let fallduration = Math.random() * 70 + 30

        let img = document.createElement('img')

        img.className = 'fall'
        img.src = 'resources/images/tetris/' + img_index + '.png'

        //랜덤 이미지 크기
        img.style.width = 1 + size + 'px'
        img.style.height = 'auto'

        // 랜덤 이미지 배치
        img.style.left = x + 'px'
        img.style.bottom = y + 'px'

        
        img.style.animationDuration = 2 + fallduration + 's'
        img.style.animationDelay = -fallduration + 's'

        container.appendChild(img)
        
    }
}


falls()
