﻿#ifdef LIGHT{X}
	uniform vec4 vLightData{X};
	uniform vec4 vLightDiffuse{X};

	#ifdef SPECULARTERM
		uniform vec4 vLightSpecular{X};
	#else
		vec4 vLightSpecular{X} = vec4(0.);
	#endif
	#ifdef SHADOW{X}
        #ifdef SHADOWCSM{X}
            uniform mat4 lightMatrix{X}[SHADOWCSMNUM_CASCADES{X}];
            uniform mat4 camViewMatCSM{X};
            uniform float viewFrustumZ{X}[SHADOWCSMNUM_CASCADES{X}];
            uniform float cascadeBlendFactor{X};

            varying vec4 vPositionFromLight{X}[SHADOWCSMNUM_CASCADES{X}];
            varying float vDepthMetric{X}[SHADOWCSMNUM_CASCADES{X}];
            varying vec4 vPositionFromCamera{X};

            #if defined(SHADOWPCSS{X})
                uniform highp sampler2DArrayShadow shadowSampler{X};
                uniform highp sampler2DArray depthSampler{X};
                uniform vec2 lightSizeUVCorrection{X}[SHADOWCSMNUM_CASCADES{X}];
                uniform float depthCorrection{X}[SHADOWCSMNUM_CASCADES{X}];
                uniform float penumbraDarkness{X};
            #elif defined(SHADOWPCF{X})
                uniform highp sampler2DArrayShadow shadowSampler{X};
            #else
                uniform highp sampler2DArray shadowSampler{X};
            #endif
        #elif defined(SHADOWCUBE{X})
			uniform samplerCube shadowSampler{X};
		#else
			varying vec4 vPositionFromLight{X};
			varying float vDepthMetric{X};

			#if defined(SHADOWPCSS{X})
				uniform highp sampler2DShadow shadowSampler{X};
				uniform highp sampler2D depthSampler{X};
			#elif defined(SHADOWPCF{X})
				uniform highp sampler2DShadow shadowSampler{X};
			#else
				uniform sampler2D shadowSampler{X};
			#endif
			uniform mat4 lightMatrix{X};
		#endif
		uniform vec4 shadowsInfo{X};
		uniform vec2 depthValues{X};
	#endif
	#ifdef SPOTLIGHT{X}
		uniform vec4 vLightDirection{X};
		uniform vec4 vLightFalloff{X};
	#elif defined(POINTLIGHT{X})
		uniform vec4 vLightFalloff{X};
	#elif defined(HEMILIGHT{X})
		uniform vec3 vLightGround{X};
	#endif
	#ifdef PROJECTEDLIGHTTEXTURE{X}
		uniform mat4 textureProjectionMatrix{X};
		uniform sampler2D projectionLightSampler{X};
	#endif
#endif