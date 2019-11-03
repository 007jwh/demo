<template>
    <div id="login">
        <div class="bg">
            <!-- 遮罩 -->
            <div class="bg-black"></div>
            <!-- 登录 -->
            <div class="login-down">
                <div class="head-pic">
                    <img src="../../static/login/2.jpg" alt="">
                </div>
                <!-- 手机号 -->
                <input type="text" placeholder="请输入手机号" v-model="phone" data-f="phone-html" @focus="focus" @blur="blur">
                <div id="phone-html">{{phone_num}}</div>
                <!-- 密码 -->
                <input type="password" placeholder="请输入密码" v-model="upwd" data-f="upwd-html" @focus="focus">
                <div id="upwd-html">{{upwd_num}}</div>
                <!-- 登录 -->
                <mt-button type="primary" @click="enter">登录</mt-button>
                <!-- 注册 -->
                <mt-button id="select" type="primary" @click="reg">注册</mt-button>
                <router-link to="/Index">跳过</router-link>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            phone: "",
            upwd: "",
            phone_num:"请输入11位手机号",
            upwd_num:"请输入3~12位(字母或数字)"
        }
    },
    methods:{
        enter(){
            var reg1=/1[0-9]{10}/;
            var reg2=/[a-z0-9]{3,12}/;
            var h=this.phone;
            var p=this.upwd;
            if(h==""){
                this.$messagebox("消息","手机号不能为空");
                return;
            }else if(p==""){
                this.$messagebox("消息","密码为空");
                return;
            }else if(reg1.test(h)==false){
                this.$messagebox("消息","手机号格式有误");
                return;
            }else if(reg2.test(p)==false){
                this.$messagebox("消息","密码格式有误");
                return;
            }
            // 发送请求
            var url="login"
            var obj={phone:h,upwd:p}
            this.axios.get(
                url,
                {params:obj}
            ).then(res=>{
                // console.log(res);
                if(res.data.code<0){
                    this.$messagebox("消息","手机号或密码有误")
                }else{
                    this.$toast({
                        message:"登录成功",
                        position:"middle",
                        duration:2000,
                        iconClass: 'iconfont icon-tixianchenggong'
                    });
                    setTimeout(() => {
                        this.$router.push("/Index")
                    }, 1000);       
                }
            })
        },
        reg(){
            var reg1=/1[0-9]{10}/;
            var reg2=/[a-z0-9]{3,12}/;
            var h=this.phone;
            var p=this.upwd;
            if(h==""){
                this.$messagebox("消息","手机号不能为空");
                return;
            }else if(p==""){
                this.$messagebox("消息","密码为空");
                return;
            }else if(reg1.test(h)==false){
                this.$messagebox("消息","手机号格式有误");
                return;
            }else if(reg2.test(p)==false){
                this.$messagebox("消息","密码格式有误");
                return;
            }
            // 发送请求
            var params="phone="+h+"&"+"upwd="+p;
            var url="/reg";
            this.axios.post(url,params).then(result=>{
                // console.log(result)
                if(result.data.code==1){
                    this.$toast({
                        message:"注册成功",
                        position:"middle",
                        duration:2000,
                        iconClass: 'iconfont icon-tixianchenggong'
                    });
                }
            })
        },
        focus(e){
            var text=e.target.dataset.f;
            // console.log(text)
            var textName=document.getElementById(text);
            // console.log(textName)
            textName.style.opacity=1
        },
        blur(){
            var reg1=/1[0-9]{10}/;
	        if(reg1.test(this.phone)){
		        this.phone_num="手机号格式正确";
	        }else{
                this.phone_num="手机号格式有误";
                return;
            }
            var obj={phone:this.phone}
            this.axios.get(
                "/search",
                {params:obj}
            ).then(res=>{
                // console.log(res.data.code)
                var btn=document.getElementById("select");
                if(res.data.code==-1){
                    this.phone_num="该用户可以注册";
                    btn.disabled=false; 
                }else{
                    this.phone_num="该用户已存在";
                    btn.disabled=true; 
                }
            })
        }
    }  
}
</script>
<style scoped>
#login{
    width: 100%;
    height: 100vh;
}
.bg{
    width: 100%;
    height: 100%;
    background: url(../../static/login/1.jpg) no-repeat; 
    background-size: cover;
    background-position: center;
    position: relative;
    z-index: 1;
}
.bg-black{
    width: 100%;
    height: 100%;
    background: black;
    opacity: 0.5;
    position: absolute;
    top: 0;
    left: 0;
    z-index: -1
}
.login-down{
    width: 80%;
    height: 80%;;
    margin: 0 auto;
    margin-top: 45%;
    display: flex;
    flex-direction: column
}
.bg::before{
    display: table;
    content: "";
}
.head-pic{
    width: 80px;
    height: 80px;
    border-radius: 50%;
    overflow: hidden;
    margin: 0 auto; 
}
.head-pic>img{
    width: 100%;
}
.login-down>input{
    /* background: #26a2ff; */
    width: 80%;
    margin: 0 auto;
    margin-top: 10px;
    height: 41px;
    border-radius: 50px;
    border: 2px solid #26a2ff;
    outline: 0;
    padding-left: 20px;
    box-sizing: border-box;
    color: #000;
    font-size: 13px;
}
.login-down>input:nth-of-type(1){
    margin-top: 30px;
}
.login-down>button{
    margin: 0 auto;
    margin-top: 10px;
    width: 80%;
}
#phone-html,#upwd-html{
    text-align: center;
    color: #fff;
    font-size: 12px;
    opacity: 0;
}
.login-down a{
    text-align: center;
    margin-top: 10px;
    color: #fff;
    cursor: pointer;
}
</style>