# ShaderPerDay
ShaderTest of Laughing
**2019-4-2 0：03**
### 设置默认在sublimeText中打开shader脚本，需要配合环境变量
 *No.1 ShaderPrepear*

### 显示的表示smoothstep函数
 *No.2 DrawSmoothStep*
 
 ![smooth](https://github.com/Laughing111/ShaderPerDay/blob/master/Assets/No.2%20DrawSmoothStep/smooth.png?raw=true)
 
```
 f(x) = x*x*(3.0-2.0*x)
```

### 画一个圆
 *No.3 DrawACircle*
 
 ![circle](https://github.com/Laughing111/ShaderPerDay/blob/master/Assets/No.3%20DrawACircle/circle.png?raw=true)
 
 ```
 //在uv图中，uv点，到圆心（0.5，0.5）的距离长度，表现为半径
	float val=1-length(uv-fixed2(0.5,0.5))*2;
	val=smoothstep(0,1,val);
	fixed4 color=fixed4(val,val,val,1);
 ```
