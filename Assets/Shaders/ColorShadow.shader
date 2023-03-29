Shader "Custom/ColorShadow"
{
    
        Properties{
          _Color("Main Color", Color) = (1,1,1,1)
          _MainTex("Base (RGB)", 2D) = "white" {}
          _ShadowColor("Shadow Color", Color) = (1,1,1,1)
        }
            SubShader{
               Tags { "RenderType" = "Opaque" }
               LOD 200

               CGPROGRAM
               #pragma surface surf CSLambert

               sampler2D _MainTex;
               fixed4 _Color;
               fixed4 _ShadowColor;

               struct Input {
                    float2 uv_MainTex;
               };

               half4 LightingCSLambert(SurfaceOutput s, half3 lightDir, half atten) {

                    fixed diff = max(0, dot(s.Normal, lightDir));
                    half4 c;

                    c.rgb = s.Albedo * _LightColor0.rgb * (diff *
                    atten * 0.5);

                    //shadow color
                    c.rgb += _ShadowColor.xyz * (1.0 - atten);
                    c.a = s.Alpha;
                    return c;

               }
               void surf(Input IN, inout SurfaceOutput o) {
                    half4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;

                   o.Albedo = c.rgb;
                   o.Alpha = c.a;
               }
               ENDCG
            }
              Fallback "Diffuse"
    
}
