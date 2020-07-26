using Raylib;

int main(string[] args) {

	const int screen_width = 800;
	const int screen_height = 450;

	print("Testing Raylib vala bindings...\n");

	Window.init(screen_width, screen_height, "raylib [core] example - mouse input");

	Vector2 ball_position = { -100f, -100f };
	Color ball_color = DARKBLUE;

	set_target_fps(60);

    // Main game loop
    while (!Window.should_close()) {
        // Update
        //----------------------------------------------------------------------------------
        ball_position = get_mouse_position();

        if (is_mouse_button_pressed(Mouse.LEFT_BUTTON)) ball_color = MAROON;
        else if (is_mouse_button_pressed(Mouse.MIDDLE_BUTTON)) ball_color = LIME;
        else if (is_mouse_button_pressed(Mouse.RIGHT_BUTTON)) ball_color = DARKBLUE;
		//----------------------------------------------------------------------------------

        // Draw
        //----------------------------------------------------------------------------------
        begin_drawing();

            clear_background(RAYWHITE);

			draw_circle_v(ball_position, 40, ball_color);
			
			draw_text("move ball with mouse and click mouse button to change color", 10, 10, 20, DARKGRAY);

        end_drawing();
        //----------------------------------------------------------------------------------
    }

    // De-Initialization
    //--------------------------------------------------------------------------------------
    Window.close();

	return 0;
}
