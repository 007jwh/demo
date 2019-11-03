<template>
    <div id="shouye">
        <!-- 轮播 -->
        <div id="carousel">
            <mt-swipe :auto="4000">
                <mt-swipe-item v-for="(p,i) of list" :key="i">
                    <img :src="p.src" alt="">
                </mt-swipe-item>
            </mt-swipe>
        </div>
        <!-- 分类 -->
        <div class="sort">
            <div v-for="(m,i) of imgs" :key="i">
                <router-link to="">
                    <img :src="m.src"  alt="">
                </router-link>
                <p>{{m.title}}</p>
            </div>
        </div>
        <!-- 广告图片 -->
        <div class="ad">
            <div class="ad-img"> 
                <img src="../../static/shouye/10.jpg" alt="">
            </div>
        </div>
        <!-- 热门商品 -->
        <div class="sp">
            <div class="sp-p">
                <p>热门商品</p>
            </div>
            <!-- 具体商品 -->
            <div class="sp-details"  v-for="(s,i) of spList" :key="i">
                <!-- 左 -->
                <div class="sp-left">
                    <img :src="s.picture" alt="">
                </div>
                <!-- 右 -->
                <div class="sp-right">
                    <!-- 标题 -->
                    <p>{{s.lname}}</p>
                    <!-- 型号 -->
                    <p>{{s.model}}</p>
                    <!-- 价格 -->
                    <p>￥{{s.price}}</p>
                    <mt-button type="primary" @click="addCart" :data-lid="s.lid" :data-price="s.price" :data-lname="s.lname">加入购物车</mt-button>
                </div>
            </div>
            <div class="more" >
                <mt-button type="primary" size="large" @click="loadMore">查看更多</mt-button>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            list:[
                {src:"static/shouye/1.jpg"},
                {src:"static/shouye/2.jpg"},
                {src:"static/shouye/3.jpg"},
                {src:"static/shouye/4.jpg"}
            ],
            imgs:[
                {src:"static/shouye/5.png",title:"超市"},
                {src:"static/shouye/6.png",title:"超市"},
                {src:"static/shouye/7.png",title:"超市"},
                {src:"static/shouye/8.png",title:"超市"},
                {src:"static/shouye/9.png",title:"超市"},
                {src:"static/shouye/5.png",title:"超市"},
                {src:"static/shouye/6.png",title:"超市"},
                {src:"static/shouye/7.png",title:"超市"},
                {src:"static/shouye/8.png",title:"超市"},
                {src:"static/shouye/9.png",title:"超市"}
            ],
            spList:[],
            pno:0
        }
    },
    created(){
        this.loadMore();
    },
    methods:{
        loadMore(){
            var url="product";
            this.pno++;
            var obj={png:this.pno};
            this.axios.get(url,{params:obj}).then(res=>{
                // console.log(res,this.pno);
                // this.spList=res.data.data;
                var rows=this.spList.concat(res.data.data);
                this.spList=rows; 
            })
        },
        addCart(e){
            var lid=e.target.dataset.lid;
            var lname=e.target.dataset.lname;
            var price=e.target.dataset.price;
            var url="addcart";
            var obj={lid,lname,price};
            // console.log(obj);
            this.axios.get(url,{params:obj}).then(res=>{
                // console.log(res);
                if(res.data.code==-1){
                    this.$toast({
                        message:"您还没登录",
                        position:"middle",
                        duration:1000
                    });
                    setTimeout(()=>{
                        this.$router.push("/Login");
                    },2000)
                }else{
                    this.$toast({
                        message:"添加成功",
                        position:"middle",
                        duration:1000
                    });
                    // 刷新购物车
                    var url="findcart";
                    this.axios.get(url).then(res=>{
                        // console.log(res);
                        this.list=res.data.data;
                        // console.log(res.data.data);      
                    })
                }   
            })
        }
    }
    
}
</script>
<style scoped>
#shouye{
    margin-top: 40px;
    background: #b6d1e6;
    margin-bottom: 55px;
}
.mint-swipe {
    width: 95%;
    height: 170px;
    margin: 0 auto;
}
#carousel{
    padding-top: 2px;
}
#carousel img{
    width: 100%;   
}
.sort{
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    text-align: center;
}
.sort>div{
    width: 20%;
}
.sort img{
    width: 60%;
}
.sort p{
    margin-top: 5px;
    margin-bottom: 8px;
    color: black;
    font-size: 13px;
}
.ad{
    width: 100%;
    height: 100px;
    position: relative;
}
.ad-img{
    width: 100%;
    height: 100%;
    border-radius: 50px;
    overflow: hidden;
}
.ad img{
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.sp{
    background: #fff;
    
}
.sp-p{
    margin: 10px 0;
    padding: 5px;
    /* border-radius: 45px; */
    font-size: 18px;
    font-weight: 900;
    letter-spacing: -2px;
    background: linear-gradient(-90deg,  #29bdd9 0%, #e92758 100%);
    text-align: center;
}
.sp-p>p{margin: 0;}
.sp-details{
    display: flex;
    height: 120px;
}
.sp-left{
    width: 30%;
    height: 120px;
}
.sp-left>img{
    width: 100%;
}
.sp-right{
    width: 70%;
    text-align: center;
}
.sp-right p{
    margin: 5px 0;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.sp-right p:nth-of-type(1){
    font-size: 16px;
    font-weight: 900; 
}
.sp-right p:nth-of-type(2){
    font-size: 14px;
    color: #ccc;
}
.sp-right p:nth-of-type(3){
    font-size: 16px;
    color: #26a2ff;
    font-weight: 900; 
}
</style>