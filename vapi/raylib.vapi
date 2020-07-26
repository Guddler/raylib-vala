/*
 * Raylib VAPI bindings
 *
 * Copyright (c)2020 Martin White (Nightweave Software) <martin _AT_ guddler.uk>
 *
 * This is free software. The license for the Raylib library aligns with my ideals
 * quite well and I therefore apply it to this VAPI and quote it below. Most notably
 * this VAPI took a lot of effort and typing so please don't claim it as your work and
 * if you use it, a mention would be appreciated, but is not legally required.
 *
 * Copyright for the Raylib library itself follows...
 *
 * --------------------------------------------------------------------------------------
 *
 * Copyright (c) 2013-2020 Ramon Santamaria (@raysan5)
 * 
 * This software is provided "as-is", without any express or implied warranty. In no event 
 * will the authors be held liable for any damages arising from the use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose, including commercial 
 * applications, and to alter it and redistribute it freely, subject to the following 
 * restrictions:
 * 
 * 1. The origin of this software must not be misrepresented; you must not claim that you 
 *    wrote the original software. If you use this software in a product, an acknowledgment
 *    in the product documentation would be appreciated but is not required.
 *
 * 2. Altered source versions must be plainly marked as such, and must not be misrepresented
 *    as being the original software.
 * 
 * 3. This notice may not be removed or altered from any source distribution.
 *
 */

/**
 * Raylib is a highly portable library for creating video games. To quote the libraries
 * author: "raylib is a simple and easy-to-use library to enjoy videogames programming.
 * raylib is highly inspired by Borland BGI graphics lib and by XNA framework"
 *
 * See: [[https://www.raylib.com/index.html]]
 */
[CCode (cprefix = "", cheader_filename="raylib.h")]
namespace Raylib {
    //#include <stdarg.h>     // Required for: va_list - Only used by TraceLogCallback

    //----------------------------------------------------------------------------------
    // Some basic Defines
    //----------------------------------------------------------------------------------

    [CCode (cname = "PI")] public const double PI;

    // #define DEG2RAD (PI/180.0f)
    // #define RAD2DEG (180.0f/PI)

    // #define MAX_TOUCH_POINTS        10      // Maximum number of touch points supported

    // Allow custom memory allocators
    //#ifndef RL_MALLOC
        // #define RL_MALLOC(sz)       malloc(sz)
    //#endif
    //#ifndef RL_CALLOC
        // #define RL_CALLOC(n,sz)     calloc(n,sz)
    //#endif
    //#ifndef RL_REALLOC
        // #define RL_REALLOC(ptr,sz)  realloc(ptr,sz)
    //#endif
    //#ifndef RL_FREE
        // #define RL_FREE(ptr)        free(ptr)
    //#endif

    // NOTE: MSC C++ compiler does not support compound literals (C99 feature)
    // Plain structures in C++ (without constructors) can be initialized from { } initializers.
    //#if defined(__cplusplus)
        // #define CLITERAL(type)      type
    //#else
        // #define CLITERAL(type)      (type)
    //#endif

    //----------------------------------------------------------------------------------
    // Structures Definition
    //----------------------------------------------------------------------------------

    // If the struct is passed by value then declare as SimpleType, else vala will pass by reference

    // Vector 2 type
    [SimpleType]
    [CCode (cname = "struct Vector2", destroy_function = "", has_type_id = true)]
    public struct Vector2 {
        float x;
        float y;
    }

    // Vector3 type
    [SimpleType]
    [CCode (cname = "struct Vector3", destroy_function = "", has_type_id = true)]
    public struct Vector3 {
        float x;
        float y;
        float z;
    }

    // Vector4 type
    [SimpleType]
    [CCode (cname = "struct Vector4", destroy_function = "", has_type_id = true)]
    public struct Vector4 {
        float x;
        float y;
        float z;
        float w;
    }

    //  // Quaternion type, same as Vector4
    //  typedef Vector4 Quaternion;
    public struct Quaternion : Vector4 { }

    //  // Matrix type (OpenGL style 4x4 - right handed, column major)
    //  typedef struct Matrix {
    //      float m0, m4, m8, m12;
    //      float m1, m5, m9, m13;
    //      float m2, m6, m10, m14;
    //      float m3, m7, m11, m15;
    //  } Matrix;

    // Color type, RGBA (32bit)
    [CCode (cname = "struct Color", has_type_id = false)]
    [SimpleType]
    public struct Color {
        uint8 r;
        uint8 g;
        uint8 b;
        uint8 a;
    }
    
    // Rectangle type
    [SimpleType]
    [CCode (cname = "struct Rectangle", cheader_filename = "raylib.h", destroy_function = "", has_type_id = true)]
    public struct Rectangle {
        float x;
        float y;
        float width;
        float height;
    }

    //  // RenderTexture2D type, for texture rendering
    //  typedef struct RenderTexture2D {
    //      unsigned int id;        // OpenGL Framebuffer Object (FBO) id
    //      Texture2D texture;      // Color buffer attachment texture
    //      Texture2D depth;        // Depth buffer attachment texture
    //      bool depthTexture;      // Track if depth attachment is a texture or renderbuffer
    //  } RenderTexture2D;

    //  // RenderTexture type, same as RenderTexture2D
    //  typedef RenderTexture2D RenderTexture;

    //  // N-Patch layout info
    //  typedef struct NPatchInfo {
    //      Rectangle sourceRec;   // Region in the texture
    //      int left;              // left border offset
    //      int top;               // top border offset
    //      int right;             // right border offset
    //      int bottom;            // bottom border offset
    //      int type;              // layout of the n-patch: 3x3, 1x3 or 3x1
    //  } NPatchInfo;

    //  // Font character info
    //  typedef struct CharInfo {
    //      int value;              // Character value (Unicode)
    //      int offsetX;            // Character offset X when drawing
    //      int offsetY;            // Character offset Y when drawing
    //      int advanceX;           // Character advance position X
    //      Image image;            // Character image data
    //  } CharInfo;

    //  // Font type, includes texture and charSet array data
    //  typedef struct Font {
    //      int baseSize;           // Base size (default chars height)
    //      int charsCount;         // Number of characters
    //      Texture2D texture;      // Characters texture atlas
    //      Rectangle *recs;        // Characters rectangles in texture
    //      CharInfo *chars;        // Characters info data
    //  } Font;

    //  // #define SpriteFont Font     // SpriteFont type fallback, defaults to Font

    //  // Camera type, defines a camera position/orientation in 3d space
    //  typedef struct Camera3D {
    //      Vector3 position;       // Camera position
    //      Vector3 target;         // Camera target it looks-at
    //      Vector3 up;             // Camera up vector (rotation over its axis)
    //      float fovy;             // Camera field-of-view apperture in Y (degrees) in perspective, used as near plane width in orthographic
    //      int type;               // Camera type, defines projection type: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
    //  } Camera3D;

    //  typedef Camera3D Camera;    // Camera type fallback, defaults to Camera3D

    //  // Camera2D type, defines a 2d camera
    //  typedef struct Camera2D {
    //      Vector2 offset;         // Camera offset (displacement from target)
    //      Vector2 target;         // Camera target (rotation and zoom origin)
    //      float rotation;         // Camera rotation in degrees
    //      float zoom;             // Camera zoom (scaling), should be 1.0f by default
    //  } Camera2D;

    //  // Vertex data definning a mesh
    //  // NOTE: Data stored in CPU memory (and GPU)
    //  typedef struct Mesh {
    //      int vertexCount;        // Number of vertices stored in arrays
    //      int triangleCount;      // Number of triangles stored (indexed or not)

    //      // Default vertex data
    //      float *vertices;        // Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
    //      float *texcoords;       // Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
    //      float *texcoords2;      // Vertex second texture coordinates (useful for lightmaps) (shader-location = 5)
    //      float *normals;         // Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
    //      float *tangents;        // Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
    //      unsigned char *colors;  // Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
    //      unsigned short *indices;// Vertex indices (in case vertex data comes indexed)

    //      // Animation vertex data
    //      float *animVertices;    // Animated vertex positions (after bones transformations)
    //      float *animNormals;     // Animated normals (after bones transformations)
    //      int *boneIds;           // Vertex bone ids, up to 4 bones influence by vertex (skinning)
    //      float *boneWeights;     // Vertex bone weight, up to 4 bones influence by vertex (skinning)

    //      // OpenGL identifiers
    //      unsigned int vaoId;     // OpenGL Vertex Array Object id
    //      unsigned int *vboId;    // OpenGL Vertex Buffer Objects id (default vertex data)
    //  } Mesh;

    //  // Shader type (generic)
    //  typedef struct Shader {
    //      unsigned int id;        // Shader program id
    //      int *locs;              // Shader locations array (MAX_SHADER_LOCATIONS)
    //  } Shader;

    //  // Material texture map
    //  typedef struct MaterialMap {
    //      Texture2D texture;      // Material map texture
    //      Color color;            // Material map color
    //      float value;            // Material map value
    //  } MaterialMap;

    //  // Material type (generic)
    //  typedef struct Material {
    //      Shader shader;          // Material shader
    //      MaterialMap *maps;      // Material maps array (MAX_MATERIAL_MAPS)
    //      float *params;          // Material generic parameters (if required)
    //  } Material;

    //  // Transformation properties
    //  typedef struct Transform {
    //      Vector3 translation;    // Translation
    //      Quaternion rotation;    // Rotation
    //      Vector3 scale;          // Scale
    //  } Transform;

    //  // Bone information
    //  typedef struct BoneInfo {
    //      char name[32];          // Bone name
    //      int parent;             // Bone parent
    //  } BoneInfo;

    //  // Model type
    //  typedef struct Model {
    //      Matrix transform;       // Local transform matrix

    //      int meshCount;          // Number of meshes
    //      Mesh *meshes;           // Meshes array

    //      int materialCount;      // Number of materials
    //      Material *materials;    // Materials array
    //      int *meshMaterial;      // Mesh material number

    //      // Animation data
    //      int boneCount;          // Number of bones
    //      BoneInfo *bones;        // Bones information (skeleton)
    //      Transform *bindPose;    // Bones base transformation (pose)
    //  } Model;

    //  // Model animation
    //  typedef struct ModelAnimation {
    //      int boneCount;          // Number of bones
    //      BoneInfo *bones;        // Bones information (skeleton)

    //      int frameCount;         // Number of animation frames
    //      Transform **framePoses; // Poses array by frame
    //  } ModelAnimation;

    //  // Ray type (useful for raycast)
    //  typedef struct Ray {
    //      Vector3 position;       // Ray position (origin)
    //      Vector3 direction;      // Ray direction
    //  } Ray;

    //  // Raycast hit information
    //  typedef struct RayHitInfo {
    //      bool hit;               // Did the ray hit something?
    //      float distance;         // Distance to nearest hit
    //      Vector3 position;       // Position of nearest hit
    //      Vector3 normal;         // Surface normal of hit
    //  } RayHitInfo;

    //  // Bounding box type
    //  typedef struct BoundingBox {
    //      Vector3 min;            // Minimum vertex box-corner
    //      Vector3 max;            // Maximum vertex box-corner
    //  } BoundingBox;

    //  // Wave type, defines audio wave data
    //  typedef struct Wave {
    //      unsigned int sampleCount;       // Total number of samples
    //      unsigned int sampleRate;        // Frequency (samples per second)
    //      unsigned int sampleSize;        // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    //      unsigned int channels;          // Number of channels (1-mono, 2-stereo)
    //      void *data;                     // Buffer data pointer
    //  } Wave;

    //  typedef struct rAudioBuffer rAudioBuffer;

    //  // Audio stream type
    //  // NOTE: Useful to create custom audio streams not bound to a specific file
    //  typedef struct AudioStream {
    //      unsigned int sampleRate;        // Frequency (samples per second)
    //      unsigned int sampleSize;        // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    //      unsigned int channels;          // Number of channels (1-mono, 2-stereo)

    //      rAudioBuffer *buffer;           // Pointer to internal data used by the audio system
    //  } AudioStream;

    //  // Sound source type
    //  typedef struct Sound {
    //      unsigned int sampleCount;       // Total number of samples
    //      AudioStream stream;             // Audio stream
    //  } Sound;

    //  // Music stream type (audio file streaming from memory)
    //  // NOTE: Anything longer than ~10 seconds should be streamed
    //  typedef struct Music {
    //      int ctxType;                    // Type of music context (audio filetype)
    //      void *ctxData;                  // Audio context data, depends on type

    //      unsigned int sampleCount;       // Total number of samples
    //      unsigned int loopCount;         // Loops count (times music will play), 0 means infinite loop

    //      AudioStream stream;             // Audio stream
    //  } Music;

    //  // Head-Mounted-Display device parameters
    //  typedef struct VrDeviceInfo {
    //      int hResolution;                // HMD horizontal resolution in pixels
    //      int vResolution;                // HMD vertical resolution in pixels
    //      float hScreenSize;              // HMD horizontal size in meters
    //      float vScreenSize;              // HMD vertical size in meters
    //      float vScreenCenter;            // HMD screen center in meters
    //      float eyeToScreenDistance;      // HMD distance between eye and display in meters
    //      float lensSeparationDistance;   // HMD lens separation distance in meters
    //      float interpupillaryDistance;   // HMD IPD (distance between pupils) in meters
    //      float lensDistortionValues[4];  // HMD lens distortion constant parameters
    //      float chromaAbCorrection[4];    // HMD chromatic aberration correction parameters
    //  } VrDeviceInfo;

    //----------------------------------------------------------------------------------
    // Enumerators Definition
    //----------------------------------------------------------------------------------
    // Vala Note: These just map through to C so generally don't need values
    //

    /**
     * System config flags 
     * NOTE: Used for bit masks
     */
    [Flags]
    [CCode (cprefix = "", has_type_id = false)]
    public enum ConfigFlag {
        FLAG_RESERVED,                      // Reserved
        FLAG_FULLSCREEN_MODE,               // Set to run program in fullscreen
        FLAG_WINDOW_RESIZABLE,              // Set to allow resizable window
        FLAG_WINDOW_UNDECORATED,            // Set to disable window decoration (frame and buttons)
        FLAG_WINDOW_TRANSPARENT,            // Set to allow transparent window
        FLAG_MSAA_4X_HINT,                  // Set to try enabling MSAA 4X
        FLAG_VSYNC_HINT,                    // Set to try enabling V-Sync on GPU
        FLAG_WINDOW_HIDDEN,                 // Set to create the window initially hidden
        FLAG_WINDOW_ALWAYS_RUN              // Set to allow windows running while minimized
    }
    
    // Trace log type
    [CCode (cprefix = "", has_type_id = false)]
    public enum TraceLogType {
        LOG_ALL,            // Display all logs
        LOG_TRACE,
        LOG_DEBUG,
        LOG_INFO,
        LOG_WARNING,
        LOG_ERROR,
        LOG_FATAL,
        LOG_NONE            // Disable logging
    }

    // Keyboard keys
    [CCode (cname = "KeyboardKey", cprefix="", has_type_id = false)]
    public enum Keyboard {
        // Alphanumeric keys
        KEY_APOSTROPHE,
        KEY_COMMA,
        KEY_MINUS,
        KEY_PERIOD,
        KEY_SLASH,
        KEY_ZERO,
        KEY_ONE,
        KEY_TWO,
        KEY_THREE,
        KEY_FOUR,
        KEY_FIVE,
        KEY_SIX,
        KEY_SEVEN,
        KEY_EIGHT,
        KEY_NINE,
        KEY_SEMICOLON,
        KEY_EQUAL,
        KEY_A,
        KEY_B,
        KEY_C,
        KEY_D,
        KEY_E,
        KEY_F,
        KEY_G,
        KEY_H,
        KEY_I,
        KEY_J,
        KEY_K,
        KEY_L,
        KEY_M,
        KEY_N,
        KEY_O,
        KEY_P,
        KEY_Q,
        KEY_R,
        KEY_S,
        KEY_T,
        KEY_U,
        KEY_V,
        KEY_W,
        KEY_X,
        KEY_Y,
        KEY_Z,
        // Function keys
        KEY_SPACE,
        KEY_ESCAPE,
        KEY_ENTER,
        KEY_TAB,
        KEY_BACKSPACE,
        KEY_INSERT,
        KEY_DELETE,
        KEY_RIGHT,
        KEY_LEFT,
        KEY_DOWN,
        KEY_UP,
        KEY_PAGE_UP,
        KEY_PAGE_DOWN,
        KEY_HOME,
        KEY_END,
        KEY_CAPS_LOCK,
        KEY_SCROLL_LOCK,
        KEY_NUM_LOCK,
        KEY_PRINT_SCREEN,
        KEY_PAUSE,
        KEY_F1,
        KEY_F2,
        KEY_F3,
        KEY_F4,
        KEY_F5,
        KEY_F6,
        KEY_F7,
        KEY_F8,
        KEY_F9,
        KEY_F10,
        KEY_F11,
        KEY_F12,
        KEY_LEFT_SHIFT,
        KEY_LEFT_CONTROL,
        KEY_LEFT_ALT,
        KEY_LEFT_SUPER,
        KEY_RIGHT_SHIFT,
        KEY_RIGHT_CONTROL,
        KEY_RIGHT_ALT,
        KEY_RIGHT_SUPER,
        KEY_KB_MENU,
        KEY_LEFT_BRACKET,
        KEY_BACKSLASH,
        KEY_RIGHT_BRACKET,
        KEY_GRAVE,
        // Keypad keys
        KEY_KP_0,
        KEY_KP_1,
        KEY_KP_2,
        KEY_KP_3,
        KEY_KP_4,
        KEY_KP_5,
        KEY_KP_6,
        KEY_KP_7,
        KEY_KP_8,
        KEY_KP_9,
        KEY_KP_DECIMAL,
        KEY_KP_DIVIDE,
        KEY_KP_MULTIPLY,
        KEY_KP_SUBTRACT,
        KEY_KP_ADD,
        KEY_KP_ENTER,
        KEY_KP_EQUAL
    }  
    
    /**
     * Android buttons
     */
    [CCode (has_type_id = false)] 
    public enum AndroidButton {
        KEY_BACK,
        KEY_MENU,
        KEY_VOLUME_UP,
        KEY_VOLUME_DOWN
    }
    
    // Mouse buttons
    [CCode (cprefix = "MOUSE_", has_type_id = false)] 
    public enum Mouse {
        LEFT_BUTTON,
        RIGHT_BUTTON,
        MIDDLE_BUTTON,
    }

    // Gamepad number
    [CCode (cprefix = "GAMEPAD_", has_type_id = false)] 
    public enum GamepadNumber {
        PLAYER1,
        PLAYER2,
        PLAYER3,
        PLAYER4
    }

    // Gamepad Buttons
    [CCode (cprefix = "GAMEPAD_BUTTON_", has_type_id = false)] 
    public enum GamepadButton {
        // This is here just for error checking
        UNKNOWN,
        // This is normally a DPAD
        LEFT_FACE_UP,
        LEFT_FACE_RIGHT,
        LEFT_FACE_DOWN,
        LEFT_FACE_LEFT,
        // This normally corresponds with PlayStation and Xbox controllers
        // XBOX: [Y,X,A,B]
        // PS3: [Triangle,Square,Cross,Circle]
        // No support for 6 button controllers though..
        RIGHT_FACE_UP,
        RIGHT_FACE_RIGHT,
        RIGHT_FACE_DOWN,
        RIGHT_FACE_LEFT,
        // Triggers
        LEFT_TRIGGER_1,
        LEFT_TRIGGER_2,
        RIGHT_TRIGGER_1,
        RIGHT_TRIGGER_2,
        // These are buttons in the center of the gamepad
        MIDDLE_LEFT,     //PS3 Select
        MIDDLE,          //PS Button/XBOX Button
        MIDDLE_RIGHT,    //PS3 Start
        // These are the joystick press in buttons
        LEFT_THUMB,
        RIGHT_THUMB
    }

    [CCode (cprefix = "", has_type_id = false)] 
    public enum GamepadAxis {
        // This is here just for error checking
        GAMEPAD_AXIS_UNKNOWN,
        // Left stick
        GAMEPAD_AXIS_LEFT_X,
        GAMEPAD_AXIS_LEFT_Y,
        // Right stick
        GAMEPAD_AXIS_RIGHT_X,
        GAMEPAD_AXIS_RIGHT_Y,
        // Pressure levels for the back triggers
        GAMEPAD_AXIS_LEFT_TRIGGER,      // [1..-1] (pressure-level)
        GAMEPAD_AXIS_RIGHT_TRIGGER      // [1..-1] (pressure-level)
    }

    // Shader location point type
    [CCode (cprefix = "LOC_", has_type_id = false)] 
    public enum ShaderLocationIndex {
        VERTEX_POSITION,
        VERTEX_TEXCOORD01,
        VERTEX_TEXCOORD02,
        VERTEX_NORMAL,
        VERTEX_TANGENT,
        VERTEX_COLOR,
        MATRIX_MVP,
        MATRIX_MODEL,
        MATRIX_VIEW,
        MATRIX_PROJECTION,
        VECTOR_VIEW,
        COLOR_DIFFUSE,
        COLOR_SPECULAR,
        COLOR_AMBIENT,
        MAP_ALBEDO,          // LOC_MAP_DIFFUSE
        MAP_METALNESS,       // LOC_MAP_SPECULAR
        MAP_NORMAL,
        MAP_ROUGHNESS,
        MAP_OCCLUSION,
        MAP_EMISSION,
        MAP_HEIGHT,
        MAP_CUBEMAP,
        MAP_IRRADIANCE,
        MAP_PREFILTER,
        MAP_BRDF
    }

    // #define LOC_MAP_DIFFUSE      LOC_MAP_ALBEDO
    // #define LOC_MAP_SPECULAR     LOC_MAP_METALNESS
 
    // Shader uniform data types
    [CCode (cprefix = "UNIFORM_", has_type_id = false)] 
    public enum ShaderUniformDataType {
        FLOAT,
        VEC2,
        VEC3,
        VEC4,
        INT,
        IVEC2,
        IVEC3,
        IVEC4,
        SAMPLER2D
    }

    // Material map type
    [CCode (cprefix = "MAP_", has_type_id = false)] 
    public enum MaterialMapType {
        ALBEDO,                 // MAP_DIFFUSE
        METALNESS,              // MAP_SPECULAR
        NORMAL,
        ROUGHNESS,
        OCCLUSION,
        EMISSION,
        HEIGHT,
        CUBEMAP,                // NOTE: Uses GL_TEXTURE_CUBE_MAP
        IRRADIANCE,             // NOTE: Uses GL_TEXTURE_CUBE_MAP
        PREFILTER,              // NOTE: Uses GL_TEXTURE_CUBE_MAP
        BRDF
    }
    
    // #define MAP_DIFFUSE      MAP_ALBEDO
    // #define MAP_SPECULAR     MAP_METALNESS

    // Pixel formats
    // NOTE: Support depends on OpenGL version and platform
    [CCode (cprefix = "", has_type_id = false)] 
    public enum PixelFormat {
        UNCOMPRESSED_GRAYSCALE,         // 8 bit per pixel (no alpha)
        UNCOMPRESSED_GRAY_ALPHA,        // 8*2 bpp (2 channels)
        UNCOMPRESSED_R5G6B5,            // 16 bpp
        UNCOMPRESSED_R8G8B8,            // 24 bpp
        UNCOMPRESSED_R5G5B5A1,          // 16 bpp (1 bit alpha)
        UNCOMPRESSED_R4G4B4A4,          // 16 bpp (4 bit alpha)
        UNCOMPRESSED_R8G8B8A8,          // 32 bpp
        UNCOMPRESSED_R32,               // 32 bpp (1 channel - float)
        UNCOMPRESSED_R32G32B32,         // 32*3 bpp (3 channels - float)
        UNCOMPRESSED_R32G32B32A32,      // 32*4 bpp (4 channels - float)
        COMPRESSED_DXT1_RGB,            // 4 bpp (no alpha)
        COMPRESSED_DXT1_RGBA,           // 4 bpp (1 bit alpha)
        COMPRESSED_DXT3_RGBA,           // 8 bpp
        COMPRESSED_DXT5_RGBA,           // 8 bpp
        COMPRESSED_ETC1_RGB,            // 4 bpp
        COMPRESSED_ETC2_RGB,            // 4 bpp
        COMPRESSED_ETC2_EAC_RGBA,       // 8 bpp
        COMPRESSED_PVRT_RGB,            // 4 bpp
        COMPRESSED_PVRT_RGBA,           // 4 bpp
        COMPRESSED_ASTC_4x4_RGBA,       // 8 bpp
        COMPRESSED_ASTC_8x8_RGBA        // 2 bpp
    }

    // Texture parameters: filter mode
    // NOTE 1: Filtering considers mipmaps if available in the texture
    // NOTE 2: Filter is accordingly set for minification and magnification
    [CCode (cprefix = "FILTER_", has_type_id = false)] 
    public enum TextureFilterMode {
	    POINT,                   // No filter, just pixel aproximation
	    BILINEAR,                // Linear filtering
	    TRILINEAR,               // Trilinear filtering (linear with mipmaps)
	    ANISOTROPIC_4X,          // Anisotropic filtering 4x
	    ANISOTROPIC_8X,          // Anisotropic filtering 8x
        ANISOTROPIC_16X,         // Anisotropic filtering 16x
    }

    // Cubemap layout type    
    [CCode (cprefix = "CUBEMAP_", has_type_id = false)] 
    public enum CubemapLayoutType {
	    AUTO_DETECT,            // Automatically detect layout type
	    LINE_VERTICAL,          // Layout is defined by a vertical line with faces
	    LINE_HORIZONTAL,        // Layout is defined by an horizontal line with faces
		CROSS_THREE_BY_FOUR,    // Layout is defined by a 3x4 cross with cubemap faces
		CROSS_FOUR_BY_THREE,    // Layout is defined by a 4x3 cross with cubemap faces
		PANORAMA                // Layout is defined by a panorama image (equirectangular map)
	}

    // Texture parameters: wrap mode
    [CCode (cprefix = "WRAP_", has_type_id = false)] 
	public enum TextureWrapMode {
		REPEAT,             // Repeats texture in tiled mode
		CLAMP,              // Clamps texture to edge pixel in tiled mode
		MIRROR_REPEAT,      // Mirrors and repeats the texture in tiled mode
		MIRROR_CLAMP        // Mirrors and clamps to border the texture in tiled mode
	}

	// Font type, defines generation method
    [CCode (cprefix = "FONT_", has_type_id = false)] 
    public enum FontType {
		DEFAULT,            // Default font generation, anti-aliased
		BITMAP,             // Bitmap font generation, no anti-aliasing
		SDF                 // SDF font generation, requires external shader
    } 
    
    // Color blending modes (pre-defined)
    [CCode (cprefix = "BLEND_", has_type_id = false)] 
    public enum BlendMode {
    	ALPHA,              // Blend textures considering alpha (default)
    	ADDITIVE,           // Blend textures adding colors
    	MULTIPLIED          // Blend textures multiplying colors
    }

    // Gestures type
    // NOTE: It could be used as flags to enable only some gestures
    [Flags]
    [CCode (cprefix = "GESTURE_", has_type_id = false)] 
    public enum GestureType {
    	NONE,
		TAP,
		DOUBLETAP,
		HOLD,
		DRAG,
        SWIPE_RIGHT,
        SWIPE_LEFT,
		SWIPE_UP,
		SWIPE_DOWN,
		PINCH_IN,
		PINCH_OUT  
    }

    // Camera system modes
    [CCode (cprefix = "CAMERA_", has_type_id = false)] 
    public enum CameraMode {
    	CUSTOM,
    	FREE,
    	ORBITAL,
    	FIRST_PERSON,
    	THIRD_PERSON
    }

    // Camera projection modes
    [CCode (cprefix = "CAMERA_", has_type_id = false)] 
    public enum CameraType {
        PERSPECTIVE,
        ORTHOGRAPHIC
    }

    // Type of n-patch
    [CCode (cprefix = "", has_type_id = false)] 
    public enum NPatchType {
    	NPT_9PATCH,             // Npatch defined by 3x3 tiles
        NPT_3PATCH_VERTICAL,    // Npatch defined by 1x3 tiles
        NPT_3PATCH_HORIZONTAL   // Npatch defined by 3x1 tiles
    }

    // Callbacks to be implemented by users
    //typedef void (*TraceLogCallback)(int logType, const char *text, va_list args);

    // Some Basic Colors
    // NOTE: Custom raylib color palette for amazing visuals on WHITE background
    [CCode (cname = "LIGHTGRAY")]   public const Color LIGHTGRAY;
    [CCode (cname = "GRAY")]        public const Color GRAY;
    [CCode (cname = "DARKGRAY")]    public const Color DARKGRAY;
    [CCode (cname = "YELLOW")]      public const Color YELLOW;
    [CCode (cname = "GOLD")]        public const Color GOLD;
    [CCode (cname = "ORANGE")]      public const Color ORANGE;
    [CCode (cname = "PINK")]        public const Color PINK;
    [CCode (cname = "RED")]         public const Color RED;
    [CCode (cname = "MAROON")]      public const Color MAROON;
    [CCode (cname = "GREEN")]       public const Color GREEN;
    [CCode (cname = "LIME")]        public const Color LIME;
    [CCode (cname = "DARKGREEN")]   public const Color DARKGREEN;
    [CCode (cname = "SKYBLUE")]     public const Color SKYBLUE;
    [CCode (cname = "BLUE")]        public const Color BLUE;
    [CCode (cname = "DARKBLUE")]    public const Color DARKBLUE;
    [CCode (cname = "PURPLE")]      public const Color PURPLE;
    [CCode (cname = "VIOLET")]      public const Color VIOLET;
    [CCode (cname = "DARKPURPLE")]  public const Color DARKPURPLE;
    [CCode (cname = "BEIGE")]       public const Color BEIGE;
    [CCode (cname = "BROWN")]       public const Color BROWN;
    [CCode (cname = "DARKBROWN")]   public const Color DARKBROWN;
    [CCode (cname = "WHITE")]       public const Color WHITE;
    [CCode (cname = "BLACK")]       public const Color BLACK;
    [CCode (cname = "BLANK")]       public const Color BLANK;
    [CCode (cname = "MAGENTA")]     public const Color MAGENTA;
    [CCode (cname = "RAYWHITE")]    public const Color RAYWHITE;

    // Skip these - we'll assume nobody will use old codebases and if
    // they do then they will have to upgrade as part of porting to Vala.
    //
    // Temporal hack to avoid breaking old codebases using
    // deprecated raylib implementation of these functions
    // #define FormatText  TextFormat
    // #define SubText     TextSubtext
    // #define ShowWindow  UnhideWindow
    // #define LoadText    LoadFileText

    //------------------------------------------------------------------------------------
    // Global Variables Definition
    //------------------------------------------------------------------------------------
    // It's lonely here...

    //------------------------------------------------------------------------------------
    // Window and Graphics Device Functions (Module: core)
    //------------------------------------------------------------------------------------

    /**
     * Window object encapsulating static window related functions
     *
     * Unless I'm mistaken, only a single Raylib window can exist at once. For this reason
     * (I presume) the C API does not expose a struct or handle to the current Window apart
     * from with one method.
     *
     * Because of this it really feels like we should implement a Window class but the best I 
     * can come up with is static methods to group the functionality together. There may be a
     * better way?
     */
    [Compact]
    public class Window {

        /**
         * Initialize window and OpenGL context
         */
        [CCode (cname = "InitWindow")]
        public static void init(int width, int height, string title);
        /**
         * Close window and unload OpenGL context
         */
        [CCode (cname = "CloseWindow")]
        public static void close();
        /**
         * Check if KEY_ESCAPE pressed or Close icon pressed
         */
        [CCode (cname = "WindowShouldClose")]
        public static bool should_close();
        /**
         * Check if window has been initialized successfully
         */
        [CCode (cname = "IsWindowReady")]
        public static bool is_ready();
        /**
         * Check if window has been minimized (or lost focus)
         */
        [CCode (cname = "IsWindowMinimized")]
        public static bool is_minimized();
        /**
         * Check if window has been resized
         */
        [CCode (cname = "IsWindowResized")]
        public static bool is_resized();
        /**
         * Check if window is currently hidden
         */
        [CCode (cname = "IsWindowHidden")]
        public static bool is_hidden();
        /**
         * Check if window is currently fullscreen
         */
        [CCode (cname = "IsWindowFullScreen")]
        public static bool is_fullscreen();
        /**
         * Toggle fullscreen mode (only PLATFORM_DESKTOP)
         */
        [CCode (cname = "ToggleFullScreen")]
        public static void toggle_fullscreen();
 		/**
 		 * Show the window
 		 */
 		[CCode (cname = "UnhideWindow")]
     	public static void unhide();
     	/**
     	 * Hide the window
     	 */
     	[CCode (cname = "HideWindow")]
		public static void hide();
		/**
		 * Set icon for window (only PLATFORM_DESKTOP)
		 */
		//[CCode (cname = "SetWindowIcon")]
		//public static void set_icon(Image image);
		/**
		 * Set title for window (only PLATFORM_DESKTOP)
		 */
		[CCode (cname = "SetWindowTitle")]
		public static void set_title(string title);
		/**
		 * Set window position on screen (only PLATFORM_DESKTOP)
		 */
		[CCode (cname = "SetWindowPosition")] 
		public static void set_position(int x, int y);
		/**
		 * Set monitor for the current window (fullscreen mode)
		 */
		[CCode (cname = "SetWindowMonitor")] 
		public static void set_monitor(int monitor);
		/**
		 * Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
		 */
		[CCode (cname = "SetWindowMinSize")] 		
		public static void set_min_size(int width, int height);
		/**
		 * Set window dimensions
		 */
		[CCode (cname = "SetWindowSize")] 
		public static void set_size(int width, int height);
		/**
		 * Get native window handle
		 */
		//[CCode (cname = "GetWindowHandle")] 
		//public static void *get_handle();
		/**
		 * Get window position XY on monitor
		 */
		[CCode (cname = "GetWindowPosition")] 
		public static Vector2 get_position();
    }
		
	/**
	 * Get current screen width
	 */
	[CCode (cname = "GetScreenWidth")] 
	public static int get_screen_width();
	/**
	 * Get current screen height
	 */
	[CCode (cname = "GetScreenHeight")] 
	public static int get_screen_height();
	/**
	 * Get number of connected monitors
	 */
	[CCode (cname = "GetMonitorCount")] 
	public static int get_monitor_count();
	/**
	 * Get primary monitor width
	 */
	[CCode (cname = "GetMonitorWidth")] 
	public static int get_monitor_width(int monitor);
	/**
	 * Get primary monitor height
	 */
	[CCode (cname = "GetMonitorHeight")] 
	public static int get_monitor_height(int monitor);
	/**
	 * Get primary monitor physical width in millimetres
	 */
	[CCode (cname = "GetMonitorPhysicalWidth")] 
	public static int get_monitor_physical_width(int monitor);
	/**
	 * Get primary monitor physical height in millimetres
	 */
	[CCode (cname = "GetMonitorPhysicalHeight")] 
	public static int get_monitor_physical_height(int monitor);
	/**
	 * Get the human-readable, UTF-8 encoded name of the primary monitor
	 */
	[CCode (cname = "GetMonitorName")] 
	public static string get_monitor_name(int monitor);
	/**
	 * Get clipboard text content
	 */
	[CCode (cname = "GetClipboardText")] 
	public static string get_clipboard_text();
	/**
	 * Set clipboard text content
	 */
	[CCode (cname = "SetClipboardText")] 
	public static void set_clipboard_text(string *text);   

    // Cursor-related functions
    /**
     * Shows cursor
     */
    [CCode (cname = "ShowCursor")]
    public void show_cursor();
    /**
     * Hides cursor
     */
    [CCode (cname = "HideCursor")]
    public void hide_cursor();
    /**
     * Check if cursor is not visible
     */
    [CCode (cname = "IsCursorHidden")]
    public bool is_cursor_hidden();
    /**
     * Enables cursor (unlock cursor)
     */
    [CCode (cname = "EnableCursor")]
    public void enable_cursor();
    /**
     * Disables cursor (lock cursor)
     */
    [CCode (cname = "DisableCursor")]
    public void disable_cursor();

    // Drawing-related functions
    /**
     * Set background color (framebuffer clear color)
     */ 
    [CCode (cname = "ClearBackground")]
    public void clear_background(Color color);
    /**
     * Setup canvas (framebuffer) to start drawing
     */
    [CCode (cname = "BeginDrawing")]
    public void begin_drawing();
    /**
     * End canvas drawing and swap buffers (double buffering)
     */
    [CCode (cname = "EndDrawing")]
    public void end_drawing();
    // void BeginMode2D(Camera2D camera);                          // Initialize 2D mode with custom camera (2D)
    /**
     * Ends 2D mode with custom camera
     */
    [CCode (cname = "EndMode2D")]
    public void end_mode_2D();
    // void BeginMode3D(Camera3D camera);                          // Initializes 3D mode with custom camera (3D)
    /**
     * Ends 3D mode and returns to default 2D orthographic mode
     */
    [CCode (cname = "EndMode3D")]
    public void end_mode_3D();
    /**
     * Initializes render texture for drawing
     */
    //[CCode (cname = "BeginTextureMode")]
    // void begin_texture_mode(RenderTexture2D target);
    /**
     * Ends drawing to render texture
     */
    [CCode (cname = "EndTextureMode")]
    public void end_texture_mode();
    /**
     * Begin scissor mode (define screen area for following drawing)
     */
    [CCode (cname = "BeginScissorMode")]
    public void begin_scissor_mode(int x, int y, int width, int height);
    /**
     * End scissor mode
     */
    [CCode (cname = "EndScissorMode")]
    public void end_scissor_mode();

    // Screen-space-related functions
    // Ray GetMouseRay(Vector2 mousePosition, Camera camera);      // Returns a ray trace from mouse position
    // Matrix GetCameraMatrix(Camera camera);                      // Returns camera transform matrix (view matrix)
    // Matrix GetCameraMatrix2D(Camera2D camera);                  // Returns camera 2d transform matrix
    // Vector2 GetWorldToScreen(Vector3 position, Camera camera);  // Returns the screen space position for a 3d world space position
    // Vector2 GetWorldToScreenEx(Vector3 position, Camera camera, int width, int height); // Returns size position for a 3d world space position
    // Vector2 GetWorldToScreen2D(Vector2 position, Camera2D camera); // Returns the screen space position for a 2d camera world space position
    // Vector2 GetScreenToWorld2D(Vector2 position, Camera2D camera); // Returns the world space position for a 2d camera screen space position

    // Timing-related functions
    /**
     * Set target FPS (maximum)
     */
    [CCode (cname = "SetTargetFPS")]
    public void set_target_fps(int fps);
    /**
     * Returns current FPS
     */
    [CCode (cname = "GetFPS")]
    public int get_fps();
    /**
     * Returns time in seconds for last frame drawn
     */
    [CCode (cname = "GetFrameTime")]
    public float get_frame_time();
    /**
     * Returns elapsed time in seconds since InitWindow()
     */
    [CCode (cname = "GetTime")]
    public double get_time();

    // Color-related functions
    // int ColorToInt(Color color);                                // Returns hexadecimal value for a Color
    // Vector4 ColorNormalize(Color color);                        // Returns color normalized as float [0..1]
    // Color ColorFromNormalized(Vector4 normalized);              // Returns color from normalized values [0..1]
    // Vector3 ColorToHSV(Color color);                            // Returns HSV values for a Color
    // Color ColorFromHSV(Vector3 hsv);                            // Returns a Color from HSV values
    // Color GetColor(int hexValue);                               // Returns a Color struct from hexadecimal value
    // Color Fade(Color color, float alpha);                       // Color fade-in or fade-out, alpha goes from 0.0f to 1.0f

    // Misc. functions
    // void SetConfigFlags(unsigned int flags);                    // Setup window configuration flags (view FLAGS)
    // void SetTraceLogLevel(int logType);                         // Set the current threshold (minimum) log level
    // void SetTraceLogExit(int logType);                          // Set the exit threshold (minimum) log level
    // void SetTraceLogCallback(TraceLogCallback callback);        // Set a trace log callback to enable custom logging
    // void TraceLog(int logType, const char *text, ...);          // Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR)
    // void TakeScreenshot(const char *fileName);                  // Takes a screenshot of current screen (saved a .png)
    // int GetRandomValue(int min, int max);                       // Returns a random value between min and max (both included)

    // Files management functions
    // unsigned char *LoadFileData(const char *fileName, unsigned int *bytesRead);     // Load file data as byte array (read)
    // void SaveFileData(const char *fileName, void *data, unsigned int bytesToWrite); // Save data to file from byte array (write)
    // char *LoadFileText(const char *fileName);                   // Load text data from file (read), returns a '\0' terminated string
    // void SaveFileText(const char *fileName, char *text);        // Save text data to file (write), string must be '\0' terminated
    // bool FileExists(const char *fileName);                      // Check if file exists
    // bool IsFileExtension(const char *fileName, const char *ext);// Check file extension
    // bool DirectoryExists(const char *dirPath);                  // Check if a directory path exists
    // const char *GetExtension(const char *fileName);             // Get pointer to extension for a filename string
    // const char *GetFileName(const char *filePath);              // Get pointer to filename for a path string
    // const char *GetFileNameWithoutExt(const char *filePath);    // Get filename string without extension (uses static string)
    // const char *GetDirectoryPath(const char *filePath);         // Get full path for a given fileName with path (uses static string)
    // const char *GetPrevDirectoryPath(const char *dirPath);      // Get previous directory path for a given path (uses static string)
    // const char *GetWorkingDirectory(void);                      // Get current working directory (uses static string)
    // char **GetDirectoryFiles(const char *dirPath, int *count);  // Get filenames in a directory path (memory should be freed)
    // void ClearDirectoryFiles(void);                             // Clear directory files paths buffers (free memory)
    // bool ChangeDirectory(const char *dir);                      // Change working directory, returns true if success
    // bool IsFileDropped(void);                                   // Check if a file has been dropped into window
    // char **GetDroppedFiles(int *count);                         // Get dropped files names (memory should be freed)
    // void ClearDroppedFiles(void);                               // Clear dropped files paths buffer (free memory)
    // long GetFileModTime(const char *fileName);                  // Get file modification time (last write time)

    // unsigned char *CompressData(unsigned char *data, int dataLength, int *compDataLength);        // Compress data (DEFLATE algorythm)
    // unsigned char *DecompressData(unsigned char *compData, int compDataLength, int *dataLength);  // Decompress data (DEFLATE algorythm)

    // Persistent storage management
    // void SaveStorageValue(unsigned int position, int value);    // Save integer value to storage file (to defined position)
    // int LoadStorageValue(unsigned int position);                // Load integer value from storage file (from defined position)

    // void OpenURL(const char *url);                              // Open URL with default system browser (if available)

    //------------------------------------------------------------------------------------
    // Input Handling Functions (Module: core)
    //------------------------------------------------------------------------------------

    // Input-related functions: keyboard

    /**
     * Detect if a key has been pressed once
     */
    [CCode (cname = "IsKeyPressed")]
    public bool is_key_pressed(int key);
    /**
     * Detect if a key is being pressed
     */
    [CCode (cname = "IsKeyDown")]
    public bool is_key_down(int key);
    /**
     * Detect if a key has been released once
     */
    [CCode (cname = "IsKeyReleased")]
    public bool is_key_released(int key);
    /**
     * Detect if a key is NOT being pressed
     */
    [CCode (cname = "IsKeyUp")]
    public bool is_key_up(int key);
    /**
     * Set a custom key to exit program (default is ESC)
     */
    [CCode (cname = "SetExitKey")]
    public void set_exit_key(int key);
    /**
     * Get key pressed, call it multiple times for chars queued
     */
    [CCode (cname = "GetKeyPressed")]
    public int get_key_pressed();

    // These all take a gamepad as input, but it's not one we created by
    // (eg) getting a reference to a gamepad, so we still cen't map as a class

    // Input-related functions: gamepads
    // bool IsGamepadAvailable(int gamepad);                   // Detect if a gamepad is available
    // bool IsGamepadName(int gamepad, const char *name);      // Check gamepad name (if available)
    // const char *GetGamepadName(int gamepad);                // Return gamepad internal name id
    // bool IsGamepadButtonPressed(int gamepad, int button);   // Detect if a gamepad button has been pressed once
    // bool IsGamepadButtonDown(int gamepad, int button);      // Detect if a gamepad button is being pressed
    // bool IsGamepadButtonReleased(int gamepad, int button);  // Detect if a gamepad button has been released once
    // bool IsGamepadButtonUp(int gamepad, int button);        // Detect if a gamepad button is NOT being pressed
    // int GetGamepadButtonPressed(void);                      // Get the last gamepad button pressed
    // int GetGamepadAxisCount(int gamepad);                   // Return gamepad axis count for a gamepad
    // float GetGamepadAxisMovement(int gamepad, int axis);    // Return axis movement value for a gamepad axis

    // Input-related functions: mouse
    /**
     * Detect if a mouse button has been pressed once
     */
    [CCode (cname = "IsMouseButtonPressed")]
    bool is_mouse_button_pressed(int button);
    // bool IsMouseButtonDown(int button);                     // Detect if a mouse button is being pressed
    // bool IsMouseButtonReleased(int button);                 // Detect if a mouse button has been released once
    // bool IsMouseButtonUp(int button);                       // Detect if a mouse button is NOT being pressed
    // int GetMouseX(void);                                    // Returns mouse position X
    // int GetMouseY(void);                                    // Returns mouse position Y
    /**
     * Returns mouse position XY
     */
    [CCode (cname = "GetMousePosition")]
    public Vector2 get_mouse_position();
    // void SetMousePosition(int x, int y);                    // Set mouse position XY
    // void SetMouseOffset(int offsetX, int offsetY);          // Set mouse offset
    // void SetMouseScale(float scaleX, float scaleY);         // Set mouse scaling
    /**
     * Returns mouse wheel movement Y
     */
    [CCode (cname = "GetMouseWheelMove")]
    public int get_mouse_wheel_move();

    // Input-related functions: touch
    // int GetTouchX(void);                                    // Returns touch position X for touch point 0 (relative to screen size)
    // int GetTouchY(void);                                    // Returns touch position Y for touch point 0 (relative to screen size)
    // Vector2 GetTouchPosition(int index);                    // Returns touch position XY for a touch point index (relative to screen size)

    //------------------------------------------------------------------------------------
    // Gestures and Touch Handling Functions (Module: gestures)
    //------------------------------------------------------------------------------------
    // void SetGesturesEnabled(unsigned int gestureFlags);     // Enable a set of gestures using flags
    // bool IsGestureDetected(int gesture);                    // Check if a gesture have been detected
    // int GetGestureDetected(void);                           // Get latest detected gesture
    // int GetTouchPointsCount(void);                          // Get touch points count
    // float GetGestureHoldDuration(void);                     // Get gesture hold time in milliseconds
    // Vector2 GetGestureDragVector(void);                     // Get gesture drag vector
    // float GetGestureDragAngle(void);                        // Get gesture drag angle
    // Vector2 GetGesturePinchVector(void);                    // Get gesture pinch delta
    // float GetGesturePinchAngle(void);                       // Get gesture pinch angle

    //------------------------------------------------------------------------------------
    // Camera System Functions (Module: camera)
    //------------------------------------------------------------------------------------
    // void SetCameraMode(Camera camera, int mode);                // Set camera mode (multiple camera modes available)
    // void UpdateCamera(Camera *camera);                          // Update camera position for selected mode

    // void SetCameraPanControl(int panKey);                       // Set camera pan key to combine with mouse movement (free camera)
    // void SetCameraAltControl(int altKey);                       // Set camera alt key to combine with mouse movement (free camera)
    // void SetCameraSmoothZoomControl(int szKey);                 // Set camera smooth zoom key to combine with mouse (free camera)
    // void SetCameraMoveControls(int frontKey, int backKey, int rightKey, int leftKey, int upKey, int downKey); // Set camera move controls (1st person and 3rd person cameras)

    //------------------------------------------------------------------------------------
    // Basic Shapes Drawing Functions (Module: shapes)
    //------------------------------------------------------------------------------------

    // Basic shapes drawing functions
    // void DrawPixel(int posX, int posY, Color color);                                                   // Draw a pixel
    // void DrawPixelV(Vector2 position, Color color);                                                    // Draw a pixel (Vector version)
    /**
     * Draw a line
     */
    [CCode (cname = "DrawLine")]
    public void draw_line(int startPosX, int startPosY, int endPosX, int endPosY, Color color);
    // void DrawLineV(Vector2 startPos, Vector2 endPos, Color color);                                     // Draw a line (Vector version)
    // void DrawLineEx(Vector2 startPos, Vector2 endPos, float thick, Color color);                       // Draw a line defining thickness
    // void DrawLineBezier(Vector2 startPos, Vector2 endPos, float thick, Color color);                   // Draw a line using cubic-bezier curves in-out
    // void DrawLineStrip(Vector2 *points, int numPoints, Color color);                                   // Draw lines sequence
    /**
     * Draw a color-filled circle
     */
    [CCode (cname = "DrawCircle")]
    public void draw_circle(int centerX, int centerY, float radius, Color color);
    // void DrawCircleSector(Vector2 center, float radius, int startAngle, int endAngle, int segments, Color color);     // Draw a piece of a circle
    // void DrawCircleSectorLines(Vector2 center, float radius, int startAngle, int endAngle, int segments, Color color);    // Draw circle sector outline
    /**
     * Draw a gradient-filled circle
     */
    [CCode (cname = "DrawCircleGradient")]
    public void draw_circle_gradient(int centerX, int centerY, float radius, Color color1, Color color2);
    /**
     * Draw a color-filled circle (Vector version)
     */
    [CCode (cname = "DrawCircleV")]
    public void draw_circle_v(Vector2 center, float radius, Color color);
    /**
     * Draw circle outline
     */
    [CCode (cname = "DrawCircleLines")]
    public void draw_circle_lines(int centerX, int centerY, float radius, Color color);
    // void DrawEllipse(int centerX, int centerY, float radiusH, float radiusV, Color color);             // Draw ellipse
    // void DrawEllipseLines(int centerX, int centerY, float radiusH, float radiusV, Color color);        // Draw ellipse outline
    // void DrawRing(Vector2 center, float innerRadius, float outerRadius, int startAngle, int endAngle, int segments, Color color); // Draw ring
    // void DrawRingLines(Vector2 center, float innerRadius, float outerRadius, int startAngle, int endAngle, int segments, Color color);    // Draw ring outline
    /**
     * Draw a color-filled rectangle
     */
    [CCode (cname = "DrawRectangle")]
    public void draw_rectangle(int posX, int posY, int width, int height, Color color);
    // void DrawRectangleV(Vector2 position, Vector2 size, Color color);                                  // Draw a color-filled rectangle (Vector version)
    // void DrawRectangleRec(Rectangle rec, Color color);                                                 // Draw a color-filled rectangle
    // void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color);                 // Draw a color-filled rectangle with pro parameters
    /**
     * Draw a vertical-gradient-filled rectangle
     */
    [CCode (cname = "DrawRectangleGradientV")]
    public void draw_rectangle_gradient_v(int posX, int posY, int width, int height, Color color1, Color color2);
    /**
     * Draw a horizontal-gradient-filled rectangle
     */
    [CCode (cname = "DrawRectangleGradientH")]
    public void draw_rectangle_gradient_h(int posX, int posY, int width, int height, Color color1, Color color2);
    // void DrawRectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4);       // Draw a gradient-filled rectangle with custom vertex colors
    /**
     * Draw rectangle outline
     */
    [CCode (cname = "DrawRectangleLines")]
    public void draw_rectangle_lines(int posX, int posY, int width, int height, Color color);
    // void DrawRectangleLinesEx(Rectangle rec, int lineThick, Color color);                              // Draw rectangle outline with extended parameters
    /**
     * Draw rectangle with rounded edges
     */
    [CCode (cname = "DrawRectangleRounded")]
    public void draw_rectangle_rounded(Rectangle rec, float roundness, int segments, Color color);
    // void DrawRectangleRoundedLines(Rectangle rec, float roundness, int segments, int lineThick, Color color); // Draw rectangle with rounded edges outline
    /**
     * Draw a color-filled triangle (vertex in counter-clockwise order!)
     */
    [CCode (cname = "DrawTriangle")]
    public void draw_triangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color);
    /**
     * Draw triangle outline (vertex in counter-clockwise order!)
     */
    [CCode (cname = "DrawTriangleLines")]
    public void draw_triangle_lines(Vector2 v1, Vector2 v2, Vector2 v3, Color color);
    // void DrawTriangleFan(Vector2 *points, int numPoints, Color color);                                 // Draw a triangle fan defined by points (first vertex is the center)
    // void DrawTriangleStrip(Vector2 *points, int pointsCount, Color color);                             // Draw a triangle strip defined by points
    /**
     * Draw a regular polygon (Vector version)
     */
    [CCode (cname = "DrawPoly")]
    public void draw_poly(Vector2 center, int sides, float radius, float rotation, Color color);
    // void DrawPolyLines(Vector2 center, int sides, float radius, float rotation, Color color);          // Draw a polygon outline of n sides

    // Basic shapes collision detection functions
    // bool CheckCollisionRecs(Rectangle rec1, Rectangle rec2);                                           // Check collision between two rectangles
    // bool CheckCollisionCircles(Vector2 center1, float radius1, Vector2 center2, float radius2);        // Check collision between two circles
    // bool CheckCollisionCircleRec(Vector2 center, float radius, Rectangle rec);                         // Check collision between circle and rectangle
    // Rectangle GetCollisionRec(Rectangle rec1, Rectangle rec2);                                         // Get collision rectangle for two rectangles collision
    // bool CheckCollisionPointRec(Vector2 point, Rectangle rec);                                         // Check if point is inside rectangle
    // bool CheckCollisionPointCircle(Vector2 point, Vector2 center, float radius);                       // Check if point is inside circle
    // bool CheckCollisionPointTriangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3);               // Check if point is inside a triangle

    //------------------------------------------------------------------------------------
    // Texture Loading and Drawing Functions (Module: textures)
    //------------------------------------------------------------------------------------

    // Texture2D type
    // NOTE: Data stored in GPU memory
    [SimpleType]
    [CCode (cname = "Texture2D")]
    public struct Texture2D {
        uint id;                // OpenGL texture id
        int width;              // Texture base width
        int height;             // Texture base height
        int mipmaps;            // Mipmap levels, 1 by default
        int format;             // Data format (PixelFormat type)
    }

    //  // Texture type, same as Texture2D
    //  typedef Texture2D Texture;

    //  // TextureCubemap type, actually, same as Texture2D
    //  typedef Texture2D TextureCubemap;


    // Image type, bpp always RGBA (32bit)
    // NOTE: Data stored in CPU memory (RAM)
    [SimpleType]
    [CCode (cname = "Image")]
    public struct ImageT {
        void *data;             // Image raw data
        int width;              // Image base width
        int height;             // Image base height
        int mipmaps;            // Mipmap levels, 1 by default
        int format;             // Data format (PixelFormat type)
    }

    //[CCode (cname = "struct bar", free_function = "bar_close", has_type_id = false)]
    //[Compact]
    //public class Bar {
    //    [CCode (cname = "bar_open")]
    //    public static Bar? open (string filename);
    //}

    // Probable class here...
    [Compact]
    [CCode (cname = "struct Image", free_function = "UnloadImage", has_type_id = false)]
    public class Image {
        [CCode (cname = "LoadImage")]
        public Image.from_file(string file_name) { }
        [CCode (cname = "LoadImageRaw")]
        public Image.from_file_raw(string file_name, int width, int height, int format, int header_size) { }

        [CCode (cname = "ExportImage")]
        public void export(string file_name);

    }

    // Image loading functions
    // NOTE: This functions do not require GPU access
    // Image LoadImage(const char *fileName);                                                             // Load image from file into CPU memory (RAM)
    // Image LoadImageEx(Color *pixels, int width, int height);                                           // Load image from Color array data (RGBA - 32bit)
    // Image LoadImagePro(void *data, int width, int height, int format);                                 // Load image from raw data with parameters
    // Image LoadImageRaw(const char *fileName, int width, int height, int format, int headerSize);       // Load image from RAW file data
    // void UnloadImage(Image image);                                                                     // Unload image from CPU memory (RAM)
    // void ExportImage(Image image, const char *fileName);                                               // Export image data to file
    // void ExportImageAsCode(Image image, const char *fileName);                                         // Export image as code file defining an array of bytes
    // Color *GetImageData(Image image);                                                                  // Get pixel data from image as a Color struct array
    // Vector4 *GetImageDataNormalized(Image image);                                                      // Get pixel data from image as Vector4 array (float normalized)

    // Image generation functions
    // Image GenImageColor(int width, int height, Color color);                                           // Generate image: plain color
    // Image GenImageGradientV(int width, int height, Color top, Color bottom);                           // Generate image: vertical gradient
    // Image GenImageGradientH(int width, int height, Color left, Color right);                           // Generate image: horizontal gradient
    // Image GenImageGradientRadial(int width, int height, float density, Color inner, Color outer);      // Generate image: radial gradient
    // Image GenImageChecked(int width, int height, int checksX, int checksY, Color col1, Color col2);    // Generate image: checked
    // Image GenImageWhiteNoise(int width, int height, float factor);                                     // Generate image: white noise
    // Image GenImagePerlinNoise(int width, int height, int offsetX, int offsetY, float scale);           // Generate image: perlin noise
    // Image GenImageCellular(int width, int height, int tileSize);                                       // Generate image: cellular algorithm. Bigger tileSize means bigger cells

    // Image manipulation functions
    // Image ImageCopy(Image image);                                                                      // Create an image duplicate (useful for transformations)
    // Image ImageFromImage(Image image, Rectangle rec);                                                  // Create an image from another image piece
    // Image ImageText(const char *text, int fontSize, Color color);                                      // Create an image from text (default font)
    // Image ImageTextEx(Font font, const char *text, float fontSize, float spacing, Color tint);         // Create an image from text (custom sprite font)
    // void ImageToPOT(Image *image, Color fillColor);                                                    // Convert image to POT (power-of-two)
    // void ImageFormat(Image *image, int newFormat);                                                     // Convert image data to desired format
    // void ImageAlphaMask(Image *image, Image alphaMask);                                                // Apply alpha mask to image
    // void ImageAlphaClear(Image *image, Color color, float threshold);                                  // Clear alpha channel to desired color
    // void ImageAlphaCrop(Image *image, float threshold);                                                // Crop image depending on alpha value
    // void ImageAlphaPremultiply(Image *image);                                                          // Premultiply alpha channel
    // void ImageCrop(Image *image, Rectangle crop);                                                      // Crop an image to a defined rectangle
    // void ImageResize(Image *image, int newWidth, int newHeight);                                       // Resize image (Bicubic scaling algorithm)
    // void ImageResizeNN(Image *image, int newWidth,int newHeight);                                      // Resize image (Nearest-Neighbor scaling algorithm)
    // void ImageResizeCanvas(Image *image, int newWidth, int newHeight, int offsetX, int offsetY, Color color);  // Resize canvas and fill with color
    // void ImageMipmaps(Image *image);                                                                   // Generate all mipmap levels for a provided image
    // void ImageDither(Image *image, int rBpp, int gBpp, int bBpp, int aBpp);                            // Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
    // void ImageFlipVertical(Image *image);                                                              // Flip image vertically
    // void ImageFlipHorizontal(Image *image);                                                            // Flip image horizontally
    // void ImageRotateCW(Image *image);                                                                  // Rotate image clockwise 90deg
    // void ImageRotateCCW(Image *image);                                                                 // Rotate image counter-clockwise 90deg
    // void ImageColorTint(Image *image, Color color);                                                    // Modify image color: tint
    // void ImageColorInvert(Image *image);                                                               // Modify image color: invert
    // void ImageColorGrayscale(Image *image);                                                            // Modify image color: grayscale
    // void ImageColorContrast(Image *image, float contrast);                                             // Modify image color: contrast (-100 to 100)
    // void ImageColorBrightness(Image *image, int brightness);                                           // Modify image color: brightness (-255 to 255)
    // void ImageColorReplace(Image *image, Color color, Color replace);                                  // Modify image color: replace color
    // Color *ImageExtractPalette(Image image, int maxPaletteSize, int *extractCount);                    // Extract color palette from image to maximum size (memory should be freed)
    // Rectangle GetImageAlphaBorder(Image image, float threshold);                                       // Get image alpha border rectangle

    // Image drawing functions
    // NOTE: Image software-rendering functions (CPU)
    // void ImageClearBackground(Image *dst, Color color);                                                // Clear image background with given color
    // void ImageDrawPixel(Image *dst, int posX, int posY, Color color);                                  // Draw pixel within an image
    // void ImageDrawPixelV(Image *dst, Vector2 position, Color color);                                   // Draw pixel within an image (Vector version)
    // void ImageDrawLine(Image *dst, int startPosX, int startPosY, int endPosX, int endPosY, Color color); // Draw line within an image
    // void ImageDrawLineV(Image *dst, Vector2 start, Vector2 end, Color color);                          // Draw line within an image (Vector version)
    // void ImageDrawCircle(Image *dst, int centerX, int centerY, int radius, Color color);               // Draw circle within an image
    // void ImageDrawCircleV(Image *dst, Vector2 center, int radius, Color color);                        // Draw circle within an image (Vector version)
    // void ImageDrawRectangle(Image *dst, int posX, int posY, int width, int height, Color color);       // Draw rectangle within an image
    // void ImageDrawRectangleV(Image *dst, Vector2 position, Vector2 size, Color color);                 // Draw rectangle within an image (Vector version)
    // void ImageDrawRectangleRec(Image *dst, Rectangle rec, Color color);                                // Draw rectangle within an image 
    // void ImageDrawRectangleLines(Image *dst, Rectangle rec, int thick, Color color);                   // Draw rectangle lines within an image
    // void ImageDraw(Image *dst, Image src, Rectangle srcRec, Rectangle dstRec, Color tint);             // Draw a source image within a destination image (tint applied to source)
    // void ImageDrawText(Image *dst, Vector2 position, const char *text, int fontSize, Color color);     // Draw text (default font) within an image (destination)
    // void ImageDrawTextEx(Image *dst, Vector2 position, Font font, const char *text, float fontSize, float spacing, Color color); // Draw text (custom sprite font) within an image (destination)

    // Texture loading functions
    // NOTE: These functions require GPU access
    // Texture2D LoadTexture(const char *fileName);                                                       // Load texture from file into GPU memory (VRAM)
    [CCode (cname = "LoadTextureFromImage")]
    public Texture2D load_texture_from_image(ImageT image);                                                       // Load texture from image data
    // TextureCubemap LoadTextureCubemap(Image image, int layoutType);                                    // Load cubemap from image, multiple image cubemap layouts supported
    // RenderTexture2D LoadRenderTexture(int width, int height);                                          // Load texture for rendering (framebuffer)
    // void UnloadTexture(Texture2D texture);                                                             // Unload texture from GPU memory (VRAM)
    // void UnloadRenderTexture(RenderTexture2D target);                                                  // Unload render texture from GPU memory (VRAM)
    // void UpdateTexture(Texture2D texture, const void *pixels);                                         // Update GPU texture with new data
    // Image GetTextureData(Texture2D texture);                                                           // Get pixel data from GPU texture and return an Image
    // Image GetScreenData(void);                                                                         // Get pixel data from screen buffer and return an Image (screenshot)

    // Texture configuration functions
    // void GenTextureMipmaps(Texture2D *texture);                                                        // Generate GPU mipmaps for a texture
    // void SetTextureFilter(Texture2D texture, int filterMode);                                          // Set texture scaling filter mode
    // void SetTextureWrap(Texture2D texture, int wrapMode);                                              // Set texture wrapping mode

    // Texture drawing functions
    // void DrawTexture(Texture2D texture, int posX, int posY, Color tint);                               // Draw a Texture2D
    // void DrawTextureV(Texture2D texture, Vector2 position, Color tint);                                // Draw a Texture2D with position defined as Vector2
    // void DrawTextureEx(Texture2D texture, Vector2 position, float rotation, float scale, Color tint);  // Draw a Texture2D with extended parameters
    // void DrawTextureRec(Texture2D texture, Rectangle sourceRec, Vector2 position, Color tint);         // Draw a part of a texture defined by a rectangle
    // void DrawTextureQuad(Texture2D texture, Vector2 tiling, Vector2 offset, Rectangle quad, Color tint);  // Draw texture quad with tiling and offset parameters
    // void DrawTexturePro(Texture2D texture, Rectangle sourceRec, Rectangle destRec, Vector2 origin, float rotation, Color tint);       // Draw a part of a texture defined by a rectangle with 'pro' parameters
    // void DrawTextureNPatch(Texture2D texture, NPatchInfo nPatchInfo, Rectangle destRec, Vector2 origin, float rotation, Color tint);  // Draws a texture (or part of it) that stretches or shrinks nicely

    // Image/Texture misc functions
    // int GetPixelDataSize(int width, int height, int format);                                           // Get pixel data size in bytes (image or texture)

    //------------------------------------------------------------------------------------
    // Font Loading and Text Drawing Functions (Module: text)
    //------------------------------------------------------------------------------------

    // Font loading/unloading functions
    // Font GetFontDefault(void);                                                            // Get the default Font
    // Font LoadFont(const char *fileName);                                                  // Load font from file into GPU memory (VRAM)
    // Font LoadFontEx(const char *fileName, int fontSize, int *fontChars, int charsCount);  // Load font from file with extended parameters
    // Font LoadFontFromImage(Image image, Color key, int firstChar);                        // Load font from Image (XNA style)
    // CharInfo *LoadFontData(const char *fileName, int fontSize, int *fontChars, int charsCount, int type); // Load font data for further use
    // Image GenImageFontAtlas(const CharInfo *chars, Rectangle **recs, int charsCount, int fontSize, int padding, int packMethod);  // Generate image font atlas using chars info
    // void UnloadFont(Font font);                                                           // Unload Font from GPU memory (VRAM)

    // Text drawing functions
    /**
     * Shows current FPS
     */
    [CCode (cname = "DrawFPS")]
    public void draw_fps(int posX, int posY);
    /**
     * Draw text (using default font)
     */
    [CCode (cname = "DrawText")]
    public void draw_text(string text, int posX, int posY, int fontSize, Color color);
    // void DrawTextEx(Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint);                // Draw text using font and additional parameters
    // void DrawTextRec(Font font, const char *text, Rectangle rec, float fontSize, float spacing, bool wordWrap, Color tint);   // Draw text using font inside rectangle limits
    // void DrawTextRecEx(Font font, const char *text, Rectangle rec, float fontSize, float spacing, bool wordWrap, Color tint,
    //                        int selectStart, int selectLength, Color selectTint, Color selectBackTint); // Draw text using font inside rectangle limits with support for text selection
    // void DrawTextCodepoint(Font font, int codepoint, Vector2 position, float scale, Color tint);   // Draw one character (codepoint)

    // Text misc. functions
    // int MeasureText(const char *text, int fontSize);                                      // Measure string width for default font
    // Vector2 MeasureTextEx(Font font, const char *text, float fontSize, float spacing);    // Measure string size for Font
    // int GetGlyphIndex(Font font, int codepoint);                                          // Get index position for a unicode character on font

    // Text strings management functions (no utf8 strings, only byte chars)
    // NOTE: Some strings allocate memory internally for returned strings, just be careful!
    // int TextCopy(char *dst, const char *src);                                             // Copy one string to another, returns bytes copied
    // bool TextIsEqual(const char *text1, const char *text2);                               // Check if two text string are equal
    // unsigned int TextLength(const char *text);                                            // Get text length, checks for '\0' ending
    /**
     * Text formatting with variables (sprintf style)
     */
    [CCode (cname = "TextFormat")]
    public unowned string text_format(string text, ...);
    // const char *TextSubtext(const char *text, int position, int length);                  // Get a piece of a text string
    // char *TextReplace(char *text, const char *replace, const char *by);                   // Replace text string (memory must be freed!)
    // char *TextInsert(const char *text, const char *insert, int position);                 // Insert text in a position (memory must be freed!)
    // const char *TextJoin(const char **textList, int count, const char *delimiter);        // Join text strings with delimiter
    // const char **TextSplit(const char *text, char delimiter, int *count);                 // Split text into multiple strings
    // void TextAppend(char *text, const char *append, int *position);                       // Append text at specific position and move cursor!
    // int TextFindIndex(const char *text, const char *find);                                // Find first text occurrence within a string
    /**
     * Get upper case version of provided string
     */
    [CCode (cname = "TextToUpper")]
    public unowned string text_to_upper(string text);
    /**
     * Get lower case version of provided string
     */
    [CCode (cname = "TextToLower")]
    public unowned string text_to_lower(string text);
    /**
     * Get Pascal case notation version of provided string
     */
    [CCode (cname = "TextToPascal")]
    public unowned string text_to_pascal(string text);
    /**
     * Get integer value from text (negative values not supported)
     */
    [CCode (cname = "TextToInteger")]
    public int TextToInteger(string text);
    /**
     * Encode text codepoint into utf8 text (memory must be freed!)
     */
    //[CCode (cname = "TextToUtf8")]
    //public string text_to_UTF8(int *codepoints, int length);

    // UTF8 text strings management functions
    // int *GetCodepoints(const char *text, int *count);               // Get all codepoints in a string, codepoints count returned by parameters
    // int GetCodepointsCount(const char *text);                       // Get total number of characters (codepoints) in a UTF8 encoded string
    // int GetNextCodepoint(const char *text, int *bytesProcessed);    // Returns next codepoint in a UTF8 encoded string; 0x3f('?') is returned on failure
    // const char *CodepointToUtf8(int codepoint, int *byteLength);    // Encode codepoint into utf8 text (char array length returned as parameter)

    //------------------------------------------------------------------------------------
    // Basic 3d Shapes Drawing Functions (Module: models)
    //------------------------------------------------------------------------------------

    // Basic geometric 3D shapes drawing functions
    // void DrawLine3D(Vector3 startPos, Vector3 endPos, Color color);                                    // Draw a line in 3D world space
    // void DrawPoint3D(Vector3 position, Color color);                                                   // Draw a point in 3D space, actually a small line
    // void DrawCircle3D(Vector3 center, float radius, Vector3 rotationAxis, float rotationAngle, Color color); // Draw a circle in 3D world space
    // void DrawCube(Vector3 position, float width, float height, float length, Color color);             // Draw cube
    // void DrawCubeV(Vector3 position, Vector3 size, Color color);                                       // Draw cube (Vector version)
    // void DrawCubeWires(Vector3 position, float width, float height, float length, Color color);        // Draw cube wires
    // void DrawCubeWiresV(Vector3 position, Vector3 size, Color color);                                  // Draw cube wires (Vector version)
    // void DrawCubeTexture(Texture2D texture, Vector3 position, float width, float height, float length, Color color); // Draw cube textured
    // void DrawSphere(Vector3 centerPos, float radius, Color color);                                     // Draw sphere
    // void DrawSphereEx(Vector3 centerPos, float radius, int rings, int slices, Color color);            // Draw sphere with extended parameters
    // void DrawSphereWires(Vector3 centerPos, float radius, int rings, int slices, Color color);         // Draw sphere wires
    // void DrawCylinder(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color); // Draw a cylinder/cone
    // void DrawCylinderWires(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color); // Draw a cylinder/cone wires
    // void DrawPlane(Vector3 centerPos, Vector2 size, Color color);                                      // Draw a plane XZ
    // void DrawRay(Ray ray, Color color);                                                                // Draw a ray line
    // void DrawGrid(int slices, float spacing);                                                          // Draw a grid (centered at (0, 0, 0))
    // void DrawGizmo(Vector3 position);                                                                  // Draw simple gizmo
    //DrawTorus(), DrawTeapot() could be useful?

    //------------------------------------------------------------------------------------
    // Model 3d Loading and Drawing Functions (Module: models)
    //------------------------------------------------------------------------------------

    // Model loading/unloading functions
    // Model LoadModel(const char *fileName);                                                            // Load model from files (meshes and materials)
    // Model LoadModelFromMesh(Mesh mesh);                                                               // Load model from generated mesh (default material)
    // void UnloadModel(Model model);                                                                    // Unload model from memory (RAM and/or VRAM)

    // Mesh loading/unloading functions
    // Mesh *LoadMeshes(const char *fileName, int *meshCount);                                           // Load meshes from model file
    // void ExportMesh(Mesh mesh, const char *fileName);                                                 // Export mesh data to file
    // void UnloadMesh(Mesh mesh);                                                                       // Unload mesh from memory (RAM and/or VRAM)

    // Material loading/unloading functions
    // Material *LoadMaterials(const char *fileName, int *materialCount);                                // Load materials from model file
    // Material LoadMaterialDefault(void);                                                               // Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
    // void UnloadMaterial(Material material);                                                           // Unload material from GPU memory (VRAM)
    // void SetMaterialTexture(Material *material, int mapType, Texture2D texture);                      // Set texture for a material map type (MAP_DIFFUSE, MAP_SPECULAR...)
    // void SetModelMeshMaterial(Model *model, int meshId, int materialId);                              // Set material for a mesh

    // Model animations loading/unloading functions
    // ModelAnimation *LoadModelAnimations(const char *fileName, int *animsCount);                       // Load model animations from file
    // void UpdateModelAnimation(Model model, ModelAnimation anim, int frame);                           // Update model animation pose
    // void UnloadModelAnimation(ModelAnimation anim);                                                   // Unload animation data
    // bool IsModelAnimationValid(Model model, ModelAnimation anim);                                     // Check model animation skeleton match

    // Mesh generation functions
    // Mesh GenMeshPoly(int sides, float radius);                                                        // Generate polygonal mesh
    // Mesh GenMeshPlane(float width, float length, int resX, int resZ);                                 // Generate plane mesh (with subdivisions)
    // Mesh GenMeshCube(float width, float height, float length);                                        // Generate cuboid mesh
    // Mesh GenMeshSphere(float radius, int rings, int slices);                                          // Generate sphere mesh (standard sphere)
    // Mesh GenMeshHemiSphere(float radius, int rings, int slices);                                      // Generate half-sphere mesh (no bottom cap)
    // Mesh GenMeshCylinder(float radius, float height, int slices);                                     // Generate cylinder mesh
    // Mesh GenMeshTorus(float radius, float size, int radSeg, int sides);                               // Generate torus mesh
    // Mesh GenMeshKnot(float radius, float size, int radSeg, int sides);                                // Generate trefoil knot mesh
    // Mesh GenMeshHeightmap(Image heightmap, Vector3 size);                                             // Generate heightmap mesh from image data
    // Mesh GenMeshCubicmap(Image cubicmap, Vector3 cubeSize);                                           // Generate cubes-based map mesh from image data

    // Mesh manipulation functions
    // BoundingBox MeshBoundingBox(Mesh mesh);                                                           // Compute mesh bounding box limits
    // void MeshTangents(Mesh *mesh);                                                                    // Compute mesh tangents
    // void MeshBinormals(Mesh *mesh);                                                                   // Compute mesh binormals

    // Model drawing functions
    // void DrawModel(Model model, Vector3 position, float scale, Color tint);                           // Draw a model (with texture if set)
    // void DrawModelEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint); // Draw a model with extended parameters
    // void DrawModelWires(Model model, Vector3 position, float scale, Color tint);                      // Draw a model wires (with texture if set)
    // void DrawModelWiresEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint); // Draw a model wires (with texture if set) with extended parameters
    // void DrawBoundingBox(BoundingBox box, Color color);                                               // Draw bounding box (wires)
    // void DrawBillboard(Camera camera, Texture2D texture, Vector3 center, float size, Color tint);     // Draw a billboard texture
    // void DrawBillboardRec(Camera camera, Texture2D texture, Rectangle sourceRec, Vector3 center, float size, Color tint); // Draw a billboard texture defined by sourceRec

    // Collision detection functions
    // bool CheckCollisionSpheres(Vector3 centerA, float radiusA, Vector3 centerB, float radiusB);       // Detect collision between two spheres
    // bool CheckCollisionBoxes(BoundingBox box1, BoundingBox box2);                                     // Detect collision between two bounding boxes
    // bool CheckCollisionBoxSphere(BoundingBox box, Vector3 center, float radius);                      // Detect collision between box and sphere
    // bool CheckCollisionRaySphere(Ray ray, Vector3 center, float radius);                              // Detect collision between ray and sphere
    // bool CheckCollisionRaySphereEx(Ray ray, Vector3 center, float radius, Vector3 *collisionPoint);   // Detect collision between ray and sphere, returns collision point
    // bool CheckCollisionRayBox(Ray ray, BoundingBox box);                                              // Detect collision between ray and box
    // RayHitInfo GetCollisionRayModel(Ray ray, Model model);                                            // Get collision info between ray and model
    // RayHitInfo GetCollisionRayTriangle(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3);                  // Get collision info between ray and triangle
    // RayHitInfo GetCollisionRayGround(Ray ray, float groundHeight);                                    // Get collision info between ray and ground plane (Y-normal plane)

    //------------------------------------------------------------------------------------
    // Shaders System Functions (Module: rlgl)
    // NOTE: This functions are useless when using OpenGL 1.1
    //------------------------------------------------------------------------------------

    // Shader loading/unloading functions
    // Shader LoadShader(const char *vsFileName, const char *fsFileName);  // Load shader from files and bind default locations
    // Shader LoadShaderCode(const char *vsCode, const char *fsCode);      // Load shader from code strings and bind default locations
    // void UnloadShader(Shader shader);                                   // Unload shader from GPU memory (VRAM)

    // Shader GetShaderDefault(void);                                      // Get default shader
    // Texture2D GetTextureDefault(void);                                  // Get default texture
    // Texture2D GetShapesTexture(void);                                   // Get texture to draw shapes
    // Rectangle GetShapesTextureRec(void);                                // Get texture rectangle to draw shapes
    // void SetShapesTexture(Texture2D texture, Rectangle source);         // Define default texture used to draw shapes

    // Shader configuration functions
    // int GetShaderLocation(Shader shader, const char *uniformName);      // Get shader uniform location
    // void SetShaderValue(Shader shader, int uniformLoc, const void *value, int uniformType);               // Set shader uniform value
    // void SetShaderValueV(Shader shader, int uniformLoc, const void *value, int uniformType, int count);   // Set shader uniform value vector
    // void SetShaderValueMatrix(Shader shader, int uniformLoc, Matrix mat);         // Set shader uniform value (matrix 4x4)
    // void SetShaderValueTexture(Shader shader, int uniformLoc, Texture2D texture); // Set shader uniform value for texture
    // void SetMatrixProjection(Matrix proj);                              // Set a custom projection matrix (replaces internal projection matrix)
    // void SetMatrixModelview(Matrix view);                               // Set a custom modelview matrix (replaces internal modelview matrix)
    // Matrix GetMatrixModelview(void);                                    // Get internal modelview matrix
    // Matrix GetMatrixProjection(void);                                   // Get internal projection matrix

    // Texture maps generation (PBR)
    // NOTE: Required shaders should be provided
    // Texture2D GenTextureCubemap(Shader shader, Texture2D map, int size);          // Generate cubemap texture from 2D texture
    // Texture2D GenTextureIrradiance(Shader shader, Texture2D cubemap, int size);   // Generate irradiance texture using cubemap data
    // Texture2D GenTexturePrefilter(Shader shader, Texture2D cubemap, int size);    // Generate prefilter texture using cubemap data
    // Texture2D GenTextureBRDF(Shader shader, int size);                  // Generate BRDF texture

    // Shading begin/end functions
    // void BeginShaderMode(Shader shader);                                // Begin custom shader drawing
    // void EndShaderMode(void);                                           // End custom shader drawing (use default shader)
    // void BeginBlendMode(int mode);                                      // Begin blending mode (alpha, additive, multiplied)
    // void EndBlendMode(void);                                            // End blending mode (reset to default: alpha blending)

    // VR control functions
    // void InitVrSimulator(void);                       // Init VR simulator for selected device parameters
    // void CloseVrSimulator(void);                      // Close VR simulator for current device
    // void UpdateVrTracking(Camera *camera);            // Update VR tracking (position and orientation) and camera
    // void SetVrConfiguration(VrDeviceInfo info, Shader distortion);      // Set stereo rendering configuration parameters
    // bool IsVrSimulatorReady(void);                    // Detect if VR simulator is ready
    // void ToggleVrMode(void);                          // Enable/Disable VR experience
    // void BeginVrDrawing(void);                        // Begin VR simulator stereo rendering
    // void EndVrDrawing(void);                          // End VR simulator stereo rendering

    //------------------------------------------------------------------------------------
    // Audio Loading and Playing Functions (Module: audio)
    //------------------------------------------------------------------------------------

    // Audio device management functions
    // void InitAudioDevice(void);                                     // Initialize audio device and context
    // void CloseAudioDevice(void);                                    // Close the audio device and context
    // bool IsAudioDeviceReady(void);                                  // Check if audio device has been initialized successfully
    // void SetMasterVolume(float volume);                             // Set master volume (listener)

    // Wave/Sound loading/unloading functions
    // Wave LoadWave(const char *fileName);                            // Load wave data from file
    // Sound LoadSound(const char *fileName);                          // Load sound from file
    // Sound LoadSoundFromWave(Wave wave);                             // Load sound from wave data
    // void UpdateSound(Sound sound, const void *data, int samplesCount);// Update sound buffer with new data
    // void UnloadWave(Wave wave);                                     // Unload wave data
    // void UnloadSound(Sound sound);                                  // Unload sound
    // void ExportWave(Wave wave, const char *fileName);               // Export wave data to file
    // void ExportWaveAsCode(Wave wave, const char *fileName);         // Export wave sample data to code (.h)

    // Wave/Sound management functions
    // void PlaySound(Sound sound);                                    // Play a sound
    // void StopSound(Sound sound);                                    // Stop playing a sound
    // void PauseSound(Sound sound);                                   // Pause a sound
    // void ResumeSound(Sound sound);                                  // Resume a paused sound
    // void PlaySoundMulti(Sound sound);                               // Play a sound (using multichannel buffer pool)
    // void StopSoundMulti(void);                                      // Stop any sound playing (using multichannel buffer pool)
    // int GetSoundsPlaying(void);                                     // Get number of sounds playing in the multichannel
    // bool IsSoundPlaying(Sound sound);                               // Check if a sound is currently playing
    // void SetSoundVolume(Sound sound, float volume);                 // Set volume for a sound (1.0 is max level)
    // void SetSoundPitch(Sound sound, float pitch);                   // Set pitch for a sound (1.0 is base level)
    // void WaveFormat(Wave *wave, int sampleRate, int sampleSize, int channels);  // Convert wave data to desired format
    // Wave WaveCopy(Wave wave);                                       // Copy a wave to a new wave
    // void WaveCrop(Wave *wave, int initSample, int finalSample);     // Crop a wave to defined samples range
    // float *GetWaveData(Wave wave);                                  // Get samples data from wave as a floats array

    // Music management functions
    // Music LoadMusicStream(const char *fileName);                    // Load music stream from file
    // void UnloadMusicStream(Music music);                            // Unload music stream
    // void PlayMusicStream(Music music);                              // Start music playing
    // void UpdateMusicStream(Music music);                            // Updates buffers for music streaming
    // void StopMusicStream(Music music);                              // Stop music playing
    // void PauseMusicStream(Music music);                             // Pause music playing
    // void ResumeMusicStream(Music music);                            // Resume playing paused music
    // bool IsMusicPlaying(Music music);                               // Check if music is playing
    // void SetMusicVolume(Music music, float volume);                 // Set volume for music (1.0 is max level)
    // void SetMusicPitch(Music music, float pitch);                   // Set pitch for a music (1.0 is base level)
    // void SetMusicLoopCount(Music music, int count);                 // Set music loop count (loop repeats)
    // float GetMusicTimeLength(Music music);                          // Get music time length (in seconds)
    // float GetMusicTimePlayed(Music music);                          // Get current music time played (in seconds)

    // AudioStream management functions
    // AudioStream InitAudioStream(unsigned int sampleRate, unsigned int sampleSize, unsigned int channels); // Init audio stream (to stream raw audio pcm data)
    // void UpdateAudioStream(AudioStream stream, const void *data, int samplesCount); // Update audio stream buffers with data
    // void CloseAudioStream(AudioStream stream);                      // Close audio stream and free memory
    // bool IsAudioStreamProcessed(AudioStream stream);                // Check if any audio stream buffers requires refill
    // void PlayAudioStream(AudioStream stream);                       // Play audio stream
    // void PauseAudioStream(AudioStream stream);                      // Pause audio stream
    // void ResumeAudioStream(AudioStream stream);                     // Resume audio stream
    // bool IsAudioStreamPlaying(AudioStream stream);                  // Check if audio stream is playing
    // void StopAudioStream(AudioStream stream);                       // Stop audio stream
    // void SetAudioStreamVolume(AudioStream stream, float volume);    // Set volume for audio stream (1.0 is max level)
    // void SetAudioStreamPitch(AudioStream stream, float pitch);      // Set pitch for audio stream (1.0 is base level)
    // void SetAudioStreamBufferSizeDefault(int size);                 // Default size for new audio streams

    //------------------------------------------------------------------------------------
    // Network (Module: network)
    //------------------------------------------------------------------------------------

    // IN PROGRESS: Check rnet.h for reference
}
