; Minecraft - New Nintendo 3DS Edition 
; color.shbin

; Handcoded by ENDERMANYK

; Uniforms
.fvec WORLDVIEWPROJ[4]

; Inputs
.in aPosition v0
.in aColor    v1

; Outputs
.out outPos position.xyzw
.out outColor color.rgba

; Constants
.constf const0(1.000000, -1.000000, 1.000000, 1.000000)
.constf const1(0.003922, 0.003922, 0.003922, 0.003922)
.constf const2(0.000000, 0.000000, 0.250000, 0.022346)

; normalizedepth
.proc normalizedepth
    mul r0.z, r0.z, r0.w
    add r0.z, -const2.z, r0.z
    mul r0.z, const2.w, r0.z
.end

; main
.proc main
    dp4 r0.x, WORLDVIEWPROJ[0], aPosition
    dp4 r0.y, WORLDVIEWPROJ[1], aPosition
    dp4 r0.z, WORLDVIEWPROJ[2], aPosition
    dp4 r0.w, WORLDVIEWPROJ[3], aPosition
    mov r0.xyz, r0.yxz
    mul outPos, const0, r0
    mul outColor, const1, aColor
    end
.end