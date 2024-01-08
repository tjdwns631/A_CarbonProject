$(function(){
	const LeftBtn = document.querySelectorAll("#container .left_side_bar > li");
    const LeftCont = document.querySelectorAll(".section_wrap > .section");
    const SlideToggleBtn = document.querySelector("#container .slide_toggle_btn");
    const LeftContWrap = document.querySelector("#container .left_side_cont");
	console.log(LeftContWrap);
	console.log("LeftCont" + LeftCont);
    //화살표 버튼 클릭시 왼쪽 컨텐츠 접었다 폈다 하는 기능
    SlideToggleBtn.addEventListener("click",()=>{
        if(SlideToggleBtn.classList.contains("on")){
            SlideToggleBtn.classList.remove("on");
            LeftContWrap.style.width = 0;
			console.log('ttt');
        }else{
            SlideToggleBtn.classList.add("on");
            LeftContWrap.style.width = "350px";
			console.log('ssss');
        }
    })
    for (let i = 0; i < LeftBtn.length; i++) {
    	LeftBtn[i].addEventListener("click", (e) => {
	        //a태그 기본기능 중지
	        e.preventDefault();
	        //왼쪽 버튼 전부 비활성화&오른쪽 컨텐츠 다 숨김
	        for (let j = 0; j < LeftBtn.length; j++) {
	            //버튼들 css on클래스 제거
	            LeftBtn[j].classList.remove("on");
	            //오른쪽 컨텐츠 전부 숨김
	            LeftCont[j].style.display = "none";
	            //화살표 버튼 일단 먼저 숨김
	            //SlideToggleBtn.style.display = "none";
	        }
	        //클릭된 버튼만 클래스 on 추가
	        e.currentTarget.classList.add("on");
	        //클릭된 버튼의 순서에 해당하는 왼쪽 컨텐츠만 등장
	        LeftCont[i].style.display = "flex";
	        //왼쪽 컨텐츠 보이게 하기
	        LeftContWrap.style.width = "350px";
	        LeftContWrap.style.display = "block";
	        //왼쪽 컨텐츠가 펼쳐지기 때문에 화살표 버튼 접기로 바꾸기
	        SlideToggleBtn.classList.add("on");
   	 	});
    };

	$('.section_sub_title .arrow').click(function(){
	    $(this).closest('.section_sub_title').next('.fold').slideToggle();
	    $(this).toggleClass('rotateArrow');
	});
    //로드뷰 열기
	$('#map_tool_ppt_roadview').click(function(){
	    $('.map.roadview').css('display','flex');
	});
	
})