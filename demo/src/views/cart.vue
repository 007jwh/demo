<template>
    <div class="cart">
        <mt-header title="购物车">
             <router-link to="/Index" slot="left">
                <mt-button icon="back">返回</mt-button>
            </router-link>       
        </mt-header>
        <!-- 全选 -->
        <div class="selectAll" @click="selectAll">
            <label><input type="checkbox" v-model="allcb"><p>全选</p></label>
            <!-- <span>总计￥111</span> -->
            <mt-button type="primary" size="small" @click="delSelect">删除选中商品</mt-button>
        </div>
        <!-- 多选 -->
        <div class="select" v-for="(p,i) of list" :key="i" @click="changeSelect">
            <label><input type="checkbox" v-model="p.cb"><span class="select_sp">商品:{{p.lname}}</span></label>
            <p>价格:￥{{p.price}}</p>
            <span>-</span>
            <p>{{p.count}}</p>
            <span :data-lid="p.lid">+</span>
            <mt-button type="primary" size="small" :data-id="p.id" @click="delSp">删除</mt-button>          
        </div>
    </div>
</template>
<script>
import { MessageBox } from 'mint-ui';
export default {
    data(){
        return{
            list:[],
            allcb:false
        }
    },
    methods:{
        loadMore(){
            var url="findcart";
            this.axios.get(url).then(res=>{
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
                    // console.log(res);
                    // this.list=res.data.data;
                    // console.log(res.data.data);
                    //加一个选中的属性
                    var list=res.data.data;
                    for(var p of list){
                        p.cb=false;
                    }
                    this.list=list;
                }
            })
        },
        delSp(e){
            MessageBox.confirm('确定删除此商品?').then(action => {
                var id=e.target.dataset.id;
                var obj={id}
                var url="del";
                this.axios.get(url,{params:obj}).then(res=>{
                    // console.log(res);
                    if(res.data.code>0){
                        this.$toast({
                            message:"删除成功",
                            position:"middle",
                            duration:1000
                        });
                        this.loadMore();
                    }else{
                       this.$toast({
                            message:"删除失败",
                            position:"middle",
                            duration:1000
                        }); 
                    }
                })
            })
        },
        selectAll(e){
            var all=e.target.checked;
            for(var p of this.list){
                p.cb=all
            }
        },
        changeSelect(){
            var sum=1;
            for(var p of this.list){
                if(p.cb){
                    sum++
                }
            }
            // console.log(sum);
            // console.log(this.list.length);
            if(sum==this.list.length){
                this.allcb=true;
            }else{
                this.allcb=false;
            }
        },
        delSelect(){
                MessageBox.confirm('确定删除选中商品?').then(action => {
                var str="";
                for(var p of this.list){
                    if(p.cb){
                        str+=p.id+","
                    }
                }
                // console.log(str)
                if(str.length==0){
                    this.$toast("请选择需要删除的商品");
                    return;
                }
                str=str.substring(0,str.length-1)
                console.log(str)
                // 6.创建url创建obj
                var url="delmore"
                var obj={id:str}
                // 7.发送ajax请求
                this.axios.get(url,{params:obj}).then(res=>{
                    console.log(res);
                    this.loadMore();
                })
            }).catch(err=>{})
        }
        // ,
        // add(e){
        //     var url="add";
        //     var lid=e.target.dataset.lid;
        //     console.log(lid)
        //     var obj={lid};
        //     this.axios.get(url,{params:obj}).then(res=>{
        //         if(res.data.code==1){
        //             console.log("商品加一");
        //             this.loadMore();
        //         }
        //     })
        // }
    },
    created(){
        this.loadMore();
    }
}
</script>
<style scoped>
p{margin: 0;}
.cart{
    background: #b6d1e6;
}
.cart>div{
    width: 100%;
    height: 50px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #bbb;
}
.cart input{
    width: 18px;
    height: 18px;
    margin-right: 10px;
}
.cart label{
    display: flex;
}
.selectAll span,.select p{
    color: red;
    font-size: 15px;
}
.select>span{
    display: block;
    width: 20px;
    height: 20px;
    border-radius: 50%;
    background: #fff;
    text-align: center;
}
.select_sp{
    width: 140px;
    height: 40px;
    overflow: hidden;
}
</style>