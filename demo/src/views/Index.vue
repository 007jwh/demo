<template>
    <div>
        <!-- 固定头 -->
        <div class="gd">
            <div id="top">
            <img src="../../static/header/icon.png" alt=""> 
            <input type="text" placeholder="搜搜看,有惊喜">
            <img src="../../static/header/search.png" alt="">
            </div>
        </div>
        <!-- 面板 -->
        <mt-tab-container v-model="active">
            <mt-tab-container-item id="tab1">
                <shouye></shouye>
            </mt-tab-container-item>
            <mt-tab-container-item id="tab2">
                分类
            </mt-tab-container-item>
            <mt-tab-container-item id="tab3">
                
            </mt-tab-container-item>
            <mt-tab-container-item id="tab4">
                我的
            </mt-tab-container-item>
        </mt-tab-container>
        <!-- 脚 -->
        <mt-tabbar v-model="active" fixed>
            <mt-tab-item id="tab1" @click.native="changeSelect(0)">
                <img slot="icon" :src="list[0].isSelect?activeImgs[0].src:normalImgs[0].src" alt="">
                首页
            </mt-tab-item>
            <mt-tab-item id="tab2" @click.native="changeSelect(1)">
                <img slot="icon" :src="list[1].isSelect?activeImgs[1].src:normalImgs[1].src" alt="">
                分类
            </mt-tab-item>
            <mt-tab-item id="tab3" @click.native="changeSelect(2),look()">
                <img slot="icon" :src="list[2].isSelect?activeImgs[2].src:normalImgs[2].src" alt="">
                购物车
            </mt-tab-item>
            <mt-tab-item id="tab4" @click.native="changeSelect(3)" >
                <img slot="icon" :src="list[3].isSelect?activeImgs[3].src:normalImgs[3].src" alt="">
                我的
            </mt-tab-item>
        </mt-tabbar>
    </div>
</template>
<script>
import shouye from "../components/shouye.vue"

export default {
    data(){
        return{
            active: "tab1",
            normalImgs:[
                {src:"../../static/tabbar/shouye.png"},
                {src:"../../static/tabbar/fenlei.png"},
                {src:"../../static/tabbar/gouwu.png"},
                {src:"../../static/tabbar/wode.png"},
            ],
            activeImgs:[
                {src:"../../static/tabbar/shouye_active.png"},
                {src:"../../static/tabbar/fenlei_active.png"},
                {src:"../../static/tabbar/gouwu_active.png"},
                {src:"../../static/tabbar/wode_active.png"},
            ],
            list:[
                {isSelect:true},
                {isSelect:false},
                {isSelect:false},
                {isSelect:false}
            ]
        }
    },
    methods:{
        changeSelect(idx){
            for(var i=0;i<this.list.length;i++){
                if(i==idx){
                    this.list[i].isSelect=true;
                }else{
                    this.list[i].isSelect=false;
                }
            }
        },
        look(){
            this.$router.push("/Cart");
            // console.log(111)
        }
    },
    components:{"shouye":shouye}
}
</script>
<style scoped>
.gd{
    position: fixed;
    top: 0;
    left: 0;width: 100%;
    z-index: 999;
}
.gd::after{
    display: block;
    content: "";
    clear: both;
}
#top{ 
    height: 40px;
    background: #b6d1e6; 
    display: flex;
    align-items: center;
}
#top>img{
    display: block;
    height: 85%;   
}  
#top>img:nth-of-type(1){margin-left: 10px;}
#top>img:nth-of-type(2){margin-right: 10px;}
#top>input{
    height: 85%;
    width: 100%;
    border-radius: 50px;
    border: 1px solid beige;
    outline: 0;
    color: #aaa;
    font-size: 13px;
    padding-left: 30px;
    margin: 0 20px;
    box-sizing: border-box;
}
.mint-tabbar,.mint-tab-item.is-selected{
    background: #b6d1e6;
}
</style>