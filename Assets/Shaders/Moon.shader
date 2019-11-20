Shader "YH/Moon"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Metallic ("Metallic", Range(0,1)) = 0.0
        _Glossiness ("Smoothness", Range(0, 1)) = 0.5
        _BumpMap ("Normalmap", 2D) = "bump" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows

        sampler2D _MainTex;
        sampler2D _BumpMap;
        half _Metallic;
        half _Glossiness;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_BumpMap;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_MainTex));
            o.Albedo = c.rgb;
            o.Metallic = _Metallic;
            o.Alpha = c.a;
            o.Smoothness = _Glossiness;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
