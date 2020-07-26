using Raylib;


int main(string[] args) {
    // Initialization
    //--------------------------------------------------------------------------------------
    const int screen_width = 800;
    const int screen_height = 450;

    Window.init(screen_width, screen_height, "raylib [core] example - input mouse wheel");

    set_target_fps(60);               // Set our game to run at 60 frames-per-second
    //--------------------------------------------------------------------------------------

    // Main game loop
    while (!Window.should_close())    // Detect window close button or ESC key
    {
        // Update
        //----------------------------------------------------------------------------------
        // TODO: Update your variables here
        //----------------------------------------------------------------------------------

        // Draw
        //----------------------------------------------------------------------------------
        begin_drawing();

			draw_text("some basic shapes available on raylib", 20, 20, 20, DARKGRAY);

			draw_circle(screen_width / 4, 120, 35, DARKBLUE);

			draw_rectangle(screen_width / 4 * 2 - 60, 100, 120, 60, RED);
			draw_rectangle_lines(screen_width / 4 * 2 - 40, 320, 80, 60, ORANGE);  // NOTE: Uses QUADS internally, not lines
			draw_rectangle_gradient_h(screen_width / 4 * 2 - 90, 170, 180, 130, MAROON, GOLD);

			draw_triangle(Vector2(){ x = screen_width / 4 * 3, y = 80},
						Vector2(){ x = screen_width / 4 * 3 - 60, y = 150},
						Vector2(){ x = screen_width / 4 * 3 + 60, y = 150}, VIOLET);

			draw_poly(Vector2(){ x = screen_width / 4 * 3, y = 320}, 6, 80, 0, BROWN);

			draw_circle_gradient(screen_width / 4, 220, 60, GREEN, SKYBLUE);

			// NOTE: We draw all LINES based shapes together to optimize internal drawing,
			// this way, all LINES are rendered in a single draw pass
			draw_line(18, 42, screen_width - 18, 42, BLACK);
			draw_circle_lines(screen_width / 4, 340, 80, DARKBLUE);
			draw_triangle_lines(Vector2(){ x = screen_width / 4 * 3, y = 160},
							Vector2(){ x = screen_width / 4*3 - 20, y = 230},
							Vector2(){ x = screen_width / 4*3 + 20, y = 230}, DARKBLUE);
        end_drawing();
        //----------------------------------------------------------------------------------
    }

    // De-Initialization
    //--------------------------------------------------------------------------------------
    Window.close();        // Close window and OpenGL context
    //--------------------------------------------------------------------------------------

    return 0;
}