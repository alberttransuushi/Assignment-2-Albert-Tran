Shader "Custom/SimpleToonRampWaves"
{
    
        Properties
        {
            _Color("Color", Color) = (1,1,1,1)
            _MainTex("Albedo (RGB)", 2D) = "white" {}
            _RampTex("Ramp Texture", 2D) = "white" {}
            _DisplacementStrength("Displancement Strength", Range(0,10)) = 0.5
            _xOffset("x Offset", Range(-10,10)) = 1
            _yOffset("y Offset", Range(-10,10)) = 1
            _zOffset("z Offset", Range(-10,10)) = 1
            _TimeShift("time shift affect", Range(0,1000)) = 0
        }
            SubShader
            {

                CGPROGRAM
                #pragma surface surf ToonRamp vertex:vert

                float4 _Color;
                sampler2D _RampTex;
                sampler2D _MainTex;
                half _DisplacementStrength;
                half _xOffset;
                half _yOffset;
                half _zOffset;
                half _TimeShift;

                float4 LightingToonRamp(SurfaceOutput s, fixed3 lightDir, fixed atten)
                {
                    float diff = dot(s.Normal, lightDir) * atten;
                    float h = diff * 0.5 + 0.5;
                    float2 rh = h;
                    float3 ramp = tex2D(_RampTex, rh).rgb;

                    float4 c;
                    c.rgb = s.Albedo * _LightColor0.rgb * (ramp);
                    c.a = s.Alpha;
                    return c;
                }
                struct Input
                {
                    float2 uv_RampTex;
                    float2 uv_MainTex;
                };

                void vert(inout appdata_full v) {
                    float displacement = (sqrt(pow(v.vertex.x + _xOffset, 2) + pow(v.vertex.y + _yOffset, 2) + pow(v.vertex.z + _zOffset, 2)) + _TimeShift * (_Time / 30)) % 2;
                    if (displacement < 1) {
                        displacement = 0;
                    }
                    else {
                        displacement = 1;
                    }
                    v.vertex.y = displacement * _DisplacementStrength;
                }

            void surf(Input IN, inout SurfaceOutput o)
            {
                fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
                o.Albedo = c.rgb;
            }
                ENDCG
            }
                FallBack "Diffuse"

    
}