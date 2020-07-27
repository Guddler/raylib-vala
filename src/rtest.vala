using Raylib;


int main(string[] args) {
    // Initialization
    //--------------------------------------------------------------------------------------
    const int screen_width = 800;
    const int screen_height = 450;

    Window.init(screen_width, screen_height, "raylib [core] example - input mouse wheel");

    var image = Image.from_file("resources/wabbit.png");
    //print("Image width: %d\n", image.width);
    Image.resize(ref image, 300, 300);
    //image_resize(out image, 300, 300);
    //print("Image width: %d\n", image.width);
    //image_flip_vertical(out image);

    Texture2D tex = load_texture_from_image(image);

    set_target_fps(60);               // Set our game to run at 60 frames-per-second
    //--------------------------------------------------------------------------------------

    // Main game loop
    while (!Window.should_close())    // Detect window close button or ESC key
    {
        // Update
        //----------------------------------------------------------------------------------

        //----------------------------------------------------------------------------------

        // Draw
        //----------------------------------------------------------------------------------
        begin_drawing();

		clear_background(RAYWHITE);

        draw_texture(tex, 100, 100, BLUE);

		draw_fps(10, 10);

        end_drawing();
        //----------------------------------------------------------------------------------
    }

    // De-Initialization
    //--------------------------------------------------------------------------------------
    Window.close();        // Close window and OpenGL context
    //--------------------------------------------------------------------------------------

    return 0;
}
