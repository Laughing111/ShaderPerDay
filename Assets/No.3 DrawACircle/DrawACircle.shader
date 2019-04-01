// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Laughing/DrawACircle"
{
	//------------------------------------【属性值】------------------------------------

	//------------------------------------【唯一的子着色器】------------------------------------
	SubShader
	{
		//关闭剔除操作
		Cull Off 
		//关闭深度写入模式
		ZWrite Off 
		//设置深度测试模式:渲染所有像素.等同于关闭透明度测试（AlphaTest Off）
		ZTest Always

		//--------------------------------唯一的通道-------------------------------
		Pass
		{
			//===========开启CG着色器语言编写模块===========
			CGPROGRAM

			//编译指令:告知编译器顶点和片段着色函数的名称
			#pragma vertex vert
			#pragma fragment frag
			
			//包含头文件
			#include "UnityCG.cginc"

			//顶点着色器输入结构
			struct appdata
			{
				float4 vertex : POSITION;//顶点位置
				float2 uv : TEXCOORD0;//一级纹理坐标
			};

			//顶点着色器输出结构（v2f，vertex to fragment）
			struct v2f
			{
				float2 uv : TEXCOORD0;//一级纹理坐标
				float4 vertex : SV_POSITION;//像素位置
			};

			fixed4 DrawACircle(float2 uv);
			//--------------------------------【顶点着色函数】-----------------------------
			// 输入：顶点输入结构体
			// 输出：顶点输出结构体
			//---------------------------------------------------------------------------------
			//顶点着色函数
			v2f vert (appdata v)
			{
				//【1】实例化一个输入结构体
				v2f o;

				//【2】填充此输出结构
				//输出的顶点位置（像素位置）为模型视图投影矩阵乘以顶点位置，也就是将三维空间中的坐标投影到了二维窗口
				o.vertex = UnityObjectToClipPos(v.vertex);
				//输入的UV纹理坐标为顶点输出的坐标
				o.uv = v.uv;

				//【3】返回此输出结构对象
				return o;
			}

			


			//--------------------------------【片段着色函数】-----------------------------
			// 输入：顶点输出结构体
			// 输出：float4型的像素颜色值
			//---------------------------------------------------------------------------------
			fixed4 frag (v2f i) : SV_Target
			{
			
				return DrawACircle(i.uv);
			}

			fixed4 DrawACircle(float2 uv)
			{

				//在uv图中，uv点，到圆心（0.5，0.5）的距离长度，表现为半径
				float val=1-length(uv-fixed2(0.5,0.5))*2;
				val=smoothstep(0,1,val);
				return fixed4(val,val,val,1);
			}

			//===========结束CG着色器语言编写模块===========
			ENDCG
		}
	}
}
