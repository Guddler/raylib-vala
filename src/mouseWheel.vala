using Raylib;


int main(string[] args) {
    // Initialization
    //--------------------------------------------------------------------------------------
    const int screen_width = 800;
    const int screen_height = 450;

    Window.init(screen_width, screen_height, "raylib [core] example - input mouse wheel");

    int box_position_y = screen_height / 2 - 40;
    int scroll_speed = 4;            // Scrolling speed in pixels

    set_target_fps(60);               // Set our game to run at 60 frames-per-second
    //--------------------------------------------------------------------------------------

    // Main game loop
    while (!Window.should_close())    // Detect window close button or ESC key
    {
        // Update
        //----------------------------------------------------------------------------------
        box_position_y -= (get_mouse_wheel_move() * scroll_speed);
        //----------------------------------------------------------------------------------

        // Draw
        //----------------------------------------------------------------------------------
        begin_drawing();

            clear_background(RAYWHITE);

            draw_rectangle(screen_width / 2 - 40, box_position_y, 80, 80, MAROON);

			draw_text("Use mouse wheel to move the cube up and down!", 10, 10, 20, GRAY);

            draw_text(text_format("Box position Y: %03i", box_position_y), 10, 40, 20, LIGHTGRAY);

        end_drawing();
        //----------------------------------------------------------------------------------
    }

    // De-Initialization
    //--------------------------------------------------------------------------------------
    Window.close();        // Close window and OpenGL context
    //--------------------------------------------------------------------------------------

    return 0;
}