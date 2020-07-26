using Raylib;

int main(string[] args) {

	const int screen_width = 800;
	const int screen_height = 450;

	print("Testing Raylib vala bindings...\n");

	Window.init(screen_width, screen_height, "raylib [core] example - keyboard input");
	Vector2 ball_position = { (float)screen_width / 2, (float)screen_height /2 };
	
	set_target_fps(60);

    // Main game loop
    while (!Window.should_close()) {
        // Update
        //----------------------------------------------------------------------------------
        if (is_key_down(Keyboard.KEY_RIGHT)) ball_position.x += 2.0f;
        if (is_key_down(Keyboard.KEY_LEFT)) ball_position.x -= 2.0f;
        if (is_key_down(Keyboard.KEY_UP)) ball_position.y -= 2.0f;
        if (is_key_down(Keyboard.KEY_DOWN)) ball_position.y += 2.0f;
        //----------------------------------------------------------------------------------

        // Draw
        //----------------------------------------------------------------------------------
        begin_drawing();

            clear_background(RAYWHITE);

            draw_text("move the ball with arrow keys", 10, 10, 20, DARKGRAY);

            draw_circle_v(ball_position, 50, MAROON);

        end_drawing();
        //----------------------------------------------------------------------------------
    }

    // De-Initialization
    //--------------------------------------------------------------------------------------
    Window.close();

	return 0;
}
