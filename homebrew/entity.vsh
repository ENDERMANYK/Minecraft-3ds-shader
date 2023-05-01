; Minecraft - New Nintendo 3DS Edition 
; entity.shbin

; Handcoded by ENDERMANYK

; Uniforms
.fvec WORLDVIEWPROJ[4], WORLD[4]
.fvec TILE_LIGHT_COLOR
.fvec UV_ANIM
.fvec UV_OFFSET
.fvec OVERLAY_COLOR
.fvec CHANGE_COLOR
.fvec GLINT_COLOR
.fvec UV_ROTATION
.fvec GLINT_UV_SCALE

; Inputs
.in aPosition  v0
.in aTexCoord  v1
.in aNormal    v2

; Outputs
.out outPos position.xyzw
.out outCoord0 texcoord0.xyzw
.out outColor color.rgba

; Constants
.constf const0(1.000000, -1.000000, 1.000000, 1.000000)
.constf const1(0.000015, 0.000015, 0.000015, 0.000015)
.constf const2(0.000000, 0.000000, 0.000000, 0.000000)
.constf const3(1.000000, 0.500000, -0.099999, 0.099999)
.constf const4(0.449997, 0.549995, 0.349998, 0.000000)
.constf const5(1.000000, 1.000000, 1.000000, 1.000000)

; lightintensity
.proc lightintensity
    dp4 r15.x, WORLD[0], aNormal
    dp4 r15.y, WORLD[1], aNormal
    dp4 r15.z, WORLD[2], aNormal
    dp4 r15.w, WORLD[3], aNormal
    dp4 r1.x, r15.xyz, r15.xyz
    mul r1.xyz, r15.xyz, r1.x
    mul r1.y, TILE_LIGHT_COLOR.w, r1.y
    add r15.y, const3.x, r1.y
    mul r15.y, const3.y, r15.y
    mul r15.x, r1.x, r1.x
    mul r15.x, const3.z, r15.x
    mul r15.z, r1.z, r1.z
    mul r15.z, const3.w, r15.z
    mul r1.x, const4.y, r15.y
    add r1.x, r1.x, r15.x
    add r1.x, r1.x, r15.z
    add r1.x, const4.x, r1.x
.end

; main
.proc main
    dp4 r0.x, WORLDVIEWPROJ[0], aPosition
    dp4 r0.y, WORLDVIEWPROJ[1], aPosition
    dp4 r0.z, WORLDVIEWPROJ[2], aPosition
    dp4 r0.w, WORLDVIEWPROJ[3], aPosition
    mov r0.xyz, r0.yxz
    mul outPos, const0, r0
    mul r0, const1, aTexCoord
    slt r1, r0, const2
    add r2, r0, r1
    mov r2.w, const0.w
    mov outCoord0, r2
    call lightintensity
    mul r0.xyz, TILE_LIGHT_COLOR.xyz, r1.x
    mov r0.w, const3.x
    mov r8, const5
    mul r8, r8, r0
    mov outColor, r8
    end
.end