; Minecraft - New Nintendo 3DS Edition 
; color_uv.shbin

; Handcoded by ENDERMANYK

; Uniforms
.fvec WORLDVIEWPROJ[4]
.fvec DARKEN
.fvec GLINT_UV_SCALE
.fvec UV_OFFSET
.fvec UV_ROTATION

; Inputs
.in aPosition v0
.in aTexCoord v1
.in aColor    v2

; Outputs
.out outPos position.xyzw
.out outCoord0 texcoord0.xyzw
.out outColor color.rgba

; Constants
.constf const0(1.000000, -1.000000, 1.000000, 1.000000)
.constf const1(0.003922, 0.003922, 0.003922, 0.003922)
.constf const2(0.000015, 0.000015, 0.000015, 0.000015)
.constf const3(0.000000, 0.000000, 0.000000, 0.000000)

; main
.proc main
    dp4 r0.x, WORLDVIEWPROJ[0], aPosition
    dp4 r0.y, WORLDVIEWPROJ[1], aPosition
    dp4 r0.z, WORLDVIEWPROJ[2], aPosition
    dp4 r0.w, WORLDVIEWPROJ[3], aPosition
    mov r0.xyz, r0.yxz
    mul outPos, const0, r0
    mul r5, const1, aColor
    mul r6, DARKEN, r5
    mov r6.w, const0.w
    mov outColor, r6
    mul r0, const2, aTexCoord
    slt r1, r0, const3
    add r2, r0, r1
    mov outCoord0, r2
    end
.end
