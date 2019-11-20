Shader "YH/Earth"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _MainTex2 ("Albedo (RGB)", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
        _BumpMap ("Nomalmap", 2D) = "bump" {}
        _TexValue ("Texture Value", Range(0, 1)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows

        sampler2D _MainTex;
        sampler2D _MainTex2;        
        sampler2D _BumpMap;
        half _Metallic;
        half _Glossiness;
        float _TexValue;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_MainTex2;
            float2 uv_BumpMap;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            fixed4 d = tex2D (_MainTex2, IN.uv_MainTex2);
            o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_MainTex));
            o.Albedo = lerp(c.rgb, d.rgb, _TexValue);
            o.Metallic = _Metallic;
            o.Alpha = c.a;
            o.Smoothness = _Glossiness;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
