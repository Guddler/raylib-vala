using Raylib;


int main(string[] args) {
    // Initialization
    //--------------------------------------------------------------------------------------
    const int screen_width = 800;
    const int screen_height = 450;

	Window.init(screen_width, screen_height, "raylib [core] example - input mouse wheel");
	

    Vector2 ball_position = { get_screen_width() / 2, get_screen_height() / 2 };
    Vector2 ball_speed = { 5.0f, 4.0f };
    int ball_radius = 20;

    bool pause = false;
    int frames_counter = 0;

    set_target_fps(60);               // Set our game to run at 60 frames-per-second
    //--------------------------------------------------------------------------------------

    // Main game loop
    while (!Window.should_close())    // Detect window close button or ESC key
    {
        // Update
        //----------------------------------------------------------------------------------
		if (is_key_pressed(Keyboard.KEY_SPACE))
			pause = !pause;

        if (!pause) {
            ball_position.x += ball_speed.x;
            ball_position.y += ball_speed.y;

            // Check walls collision for bouncing
			if ((ball_position.x >= (get_screen_width() - ball_radius)) || (ball_position.x <= ball_radius))
				ball_speed.x *= -1.0f;
			if ((ball_position.y >= (get_screen_height() - ball_radius)) || (ball_position.y <= ball_radius))
				ball_speed.y *= -1.0f;
		} else {
			frames_counter++;
		}

        //----------------------------------------------------------------------------------

        // Draw
        //----------------------------------------------------------------------------------
        begin_drawing();

		clear_background(RAYWHITE);

		draw_circle_v(ball_position, ball_radius, MAROON);
		draw_text("PRESS SPACE to PAUSE BALL MOVEMENT", 10, get_screen_height() - 25, 20, LIGHTGRAY);

		// On pause, we draw a blinking message
		if (pause && (((frames_counter / 30) % 2) == 0))
			draw_text("PAUSED", 350, 200, 30, GRAY);

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