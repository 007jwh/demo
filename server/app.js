// 引入
const  express=require("express");
const  mysql=require("mysql");
const  cors=require("cors");
const  session=require("express-session");
var bodyParser = require('body-parser');


// 创建连接池
var pool=mysql.createPool({
    host:"w.rdc.sae.sina.com.cn",
    user:"xzn0o1znn2",
    password:"5lhhhwzz4yyx4yhzz4jy3y1xz2kk5j04yx5hki4j",
    port:3306,
    database:"app_demofly",
    connectionLimit:15
});


var server = express();
server.use(bodyParser.urlencoded({extended:true}));

// 跨域
server.use(cors({
    origin:["http://127.0.0.1:3001","http://localhost:8080"],
    credentials:true
}));

// session
server.use(session({
    secret:"128位字符串",
    resave:true,
    saveUninitialized:true
}));


// 配置静态目录
server.use(express.static("public"));
// 绑定端口
server.listen(5050);




// 登录
server.get("/login",(req,res)=>{
    var phone=req.query.phone;
    var upwd=req.query.upwd;
    var sql="SELECT id FROM demo_login WHERE phone=? AND upwd=md5(?)";
    pool.query(sql,[phone,upwd],(err,result)=>{
        if(err) throw err;
        if(result.length==0){
            res.send({code:-1,msg:"手机号或密码输入有误"})
        }else{
            // console.log(result)
            req.session.uid=result[0].id;
            res.send({code:1,msg:"登录成功"})
        }
    })
})
// http://127.0.0.1:4000/login?phone=18136515334&upwd=123


// 注册
server.post("/reg",(req,res)=>{
    var obj=req.body;
    pool.query('INSERT INTO demo_login VALUES(null,?,md5(?))',[obj.phone,obj.upwd],function(err,result){
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1, msg:'register suc'});
        }
    })
  }
)


// 判断是否注册
server.get("/search",(req,res)=>{
    var phone = req.query.phone;
    var sql = "SELECT id FROM demo_login WHERE phone = ?";
    pool.query(sql,[phone],(err,result)=>{
    if(err)throw err;
    if(result.length==0){
      res.send({code:-1,msg:"该用户可以注册"})
    }else{
      res.send({code:1,msg:"用户名已注册"})
    }
  })
})


//分页显示商品列表
server.get("/product",(req,res)=>{
    var pno=req.query.pno;
    var ps=req.query.pageSize;
    if(!pno){pno=1};
    if(!ps){ps=10};
    var off=(pno-1)*ps;
    ps=parseInt(ps);
    var sql="SELECT lid,picture,lname,model,price FROM demo_laptop LIMIT ?,?";
    pool.query(sql,[off,ps],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result})
    })
})
//http://127.0.0.1:4000/product
//http://127.0.0.1:4000/product?pno=2


//添加至购物车
server.get("/addcart",(req,res)=>{
    // 查看是否登录
    var uid=req.session.uid;
    // console.log(uid);
    if(!uid){
        res.send({code:-1,msg:"请登录"});
        return;
    }
    // 获取
    var lid=req.query.lid;
    var lname=req.query.lname;
    var price=req.query.price;
    var sql="SELECT id FROM demo_cart WHERE uid=? AND lid=?";
    pool.query(sql,[uid,lid],(err,result)=>{
        if(err)throw err;
        if(result.length==0){
            var sql=`INSERT INTO demo_cart VALUES(null,${lid},1,'${lname}',${price},${uid})`
        }else{
            var sql=`UPDATE demo_cart SET count=count+1 WHERE uid=${uid} AND lid=${lid}`
        }
        pool.query(sql,(err,result)=>{
            if(err) throw err;
            res.send({code:1,msg:"添加成功"})
        })
    })
})
//http://127.0.0.1:4000/addcart?lid=1&lname=华为(HUAWEI)Mate30&price=4299.00
// http://127.0.0.1:4000/login?phone=18136515334&upwd=123


//查询指定用户的购物车
server.get("/findcart",(req,res)=>{
    var uid=req.session.uid;
    if(!uid){
        res.send({code:-1,msg:"请登录"});
        return;
    }
    var sql="SELECT id,lid,lname,price,count FROM demo_cart WHERE uid=?"
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result})
    })
})
//http://127.0.0.1:4000/findcart




//删除制定商品
server.get("/del",(req,res)=>{
    var uid=req.session.uid;
    if(!uid){
        res.send({code:-2,msg:"请登录"});
        return;
    }
    var id=req.query.id;
    var sql="DELETE FROM demo_cart WHERE id=?";
    pool.query(sql,[id],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"删除成功"})
        }else{
            res.send({code:-1,msg:"删除失败"})
        }
    })
})

//http://127.0.0.1:4000/del?lid=1


// 删除多个商品
server.get("/delmore",(req,res)=>{
    var uid=req.session.uid;
    if(!uid){
        res.send({code:-2,msg:"请登录"});
        return;
    }
    var id=req.query.id;   //商品1，2
    var sql=`DELETE FROM demo_cart WHERE id IN (${id})`;
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"删除成功"})
        }else{
            res.send({code:-1,msg:"删除失败"})
        }
    })
})
//http://127.0.0.1:4000/del?lid=1



//商品数量的加
// server.get("/add",(req,res)=>{
//     var uid=req.session.uid;
//     if(!uid){
//         res.send({code:-2,msg:"请登录"});
//         return;
//     }
//     var lid=req.query.lid;
//     var sql=`UPDATE demo_cart SET count=count+1 WHERE uid=${uid} AND id=${lid}`;
//     pool.query(sql,(err,result)=>{
//         if(err) throw err;
//         res.send({code:1,msg:"商品加一"})
//     })
// })