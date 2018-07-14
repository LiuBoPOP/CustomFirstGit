

























































































































































windSize()
  $(window).resize(function(){
    windSize()
  });
  function windSize(){
    $("html").css({"font-size":$(window).width()/16+"px"})
  }
  // $(".trading-menu>span").click(function(){
  //   $(this).parent().find(".trading-menu-dropdown").toggle();
  // })
  function hashMap() {

        this.keys = new Array();

        this.data = new Array();

        //添加键值对

        this.put = function(key, value) {

            if (this.data[key] == null ) {

                //如键不存在则身【键】数组添加键名

                this.keys.push(key);

            }

            this.data[key] = value;

            //给键赋值

            this.keys.sort(this.sortNumber);



        };

        this.sortNumber = function(a, b){

            return a - b

        };

        this.removeByValue = function(arr, val) {

            for (var i = 0; i < arr.length; i++) {

                if (arr[i] == val) {

                    arr.splice(i, 1);

                    break;

                }

            }

            this.keys.sort(this.sortNumber);

        };

        //获取键对应的值

        this.get = function(key) {

            return this.data[key];

        };

        //去除键值，(去除键数据中的键名及对应的值)

        this.remove = function(key) {

            this.removeByValue(this.keys, key);

            this.data[key] = null ;

        };

        //判断键值元素是否为空

        this.isEmpty = function() {

            return this.keys.length == 0;

        };

        //获取键值元素大小

        this.size = function() {

            return this.keys.length;

        };

        //遍历Map,执行处理函数. 回调函数 function(key,value,index){..}

        this.each = function(fn) {

            if (typeof fn != 'function') {

                return;

            }

            var len = this.keys.length;

            for (var i = 0; i < len; i++) {

                var k = this.keys[i];

                fn(k, this.data[k], i);

            }

        };

        //获取键值数组,返回键值对象{key,value}的数组

        this.entrys = function() {

            var len = this.keys.length;

            var entrys = new Array(len);

            for (var i = 0; i < len; i++) {

                entrys[i] = {

                    key: this.keys[i],

                    value: this.data[i]

                };

            }

            return entrys;

        };

    }











// // 复位
// function fuwei(name,type){
//   var inner=$("#"+name+" .tradeNew-table")[0];
//   var aboveY=-($(inner).find("li").height()*($(inner).find("li").length-type))
//   inner.style.top=aboveY+"px"
// }
// function fuweis(name,type){
//   var inner=$("#"+name+" .tradeNew-table")[0];
//   var aboveY=0
//   inner.style.top=aboveY+"px"
// }

function tuodong(name,type){

    var inner=$("#"+name+" .tradeNew-table")[0];
    var startX,//触摸时的坐标
    startY,
     x, //滑动的距离
     y, //设一个全局变量记录上一次内部块滑动的位置 
     aboveY,myb;
     // if(type==1){
        aboveY=-($(inner).find("li").height()*($(inner).find("li").length-type))
        myb = -($(inner).find("li").height()*($(inner).find("li").length-type));
     // }else{
     //    aboveY=0;
     // }
    inner.style.top=aboveY+"px"
    console.log($(inner).find("li").height(),$(inner).find("li").length,type)

    function touchSatrt(e){//触摸
        e.preventDefault();
        var touch=e.touches[0];
        startY = touch.pageY;   //刚触摸时的坐标              
    }

    function touchMove(e){//滑动      

         e.preventDefault();        
         var  touch = e.touches[0];      
         var mynum ;         
         y = touch.pageY - startY;//滑动的距离
        if($(inner).find("li").length<=type){
          mynum = myb
        }else if(aboveY+y<=-($(inner).find("li").height()*($(inner).find("li").length-type))){
           mynum = -($(inner).find("li").height()*($(inner).find("li").length-type>0?$(inner).find("li").length-type:0));
        }else if(aboveY+y>=0){
           mynum = 0
        }else{
           mynum = aboveY+y
        }
          
        inner.style.top=mynum+"px"; //这一句中的aboveY是inner上次滑动后的位置  
 
    }  

    function touchEnd(e){//手指离开屏幕
      e.preventDefault();                   
      aboveY=parseInt(inner.style.top?inner.style.top:0);//touch结束后记录内部滑块滑动的位置 在全局变量中体现 一定要用parseInt()将其转化为整数字;

    }//
     document.getElementById(name).addEventListener('touchstart', touchSatrt,false);  
     document.getElementById(name).addEventListener('touchmove', touchMove,false);  
     document.getElementById(name).addEventListener('touchend', touchEnd,false);  
}



function tuodongs(name,type){

    var inner=$("#"+name+" .tradeNew-table")[0];
    var startX,//触摸时的坐标
    startY,
     x, //滑动的距离
     y, //设一个全局变量记录上一次内部块滑动的位置 
     aboveY;
     // if(type==1){
        // aboveY=-($(inner).find("li").height()*($(inner).find("li").length-8))
     // }else{
        aboveY=0;
     // }
    inner.style.top=aboveY+"px"
    function touchSatrt(e){//触摸
        e.preventDefault();
        var touch=e.touches[0];
        startY = touch.pageY;   //刚触摸时的坐标              
    }
    
    function touchMove(e){//滑动      

         e.preventDefault();        
         var  touch = e.touches[0];      
         var mynum ;         
         y = touch.pageY - startY;//滑动的距离
        // inner.style.webkitTransform = 'translate(' + 0+ 'px, ' + y + 'px)';  //也可以用css3的方式     
        // inner.style.top=(aboveY+y<=0?0:aboveY+y)+"px"; //这一句中的aboveY是inner上次滑动后的位置  
        // console.log(aboveY,y,touch.pageY ,startY)
        // console.log($(inner).find("li").height()*($(inner).find("li").length-8))
        if(aboveY+y>=0){
            mynum = 0;
        }else if(aboveY+y<=-($(inner).find("li").height()*($(inner).find("li").length-type))){
           mynum = -($(inner).find("li").height()*($(inner).find("li").length-type>0?$(inner).find("li").length-type:0));
        }else{
            mynum = aboveY+y
        }
        inner.style.top=mynum+"px"; //这一句中的aboveY是inner上次滑动后的位置  

        // inner.style.top=aboveY+y+"px"; //这一句中的aboveY是inner上次滑动后的位置  
        
    }  

    function touchEnd(e){//手指离开屏幕
      e.preventDefault();                   
      aboveY=parseInt(inner.style.top?inner.style.top:0);//touch结束后记录内部滑块滑动的位置 在全局变量中体现 一定要用parseInt()将其转化为整数字;

    }//
     document.getElementById(name).addEventListener('touchstart', touchSatrt,false);  
     document.getElementById(name).addEventListener('touchmove', touchMove,false);  
     document.getElementById(name).addEventListener('touchend', touchEnd,false);  
}