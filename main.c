#include <stdio.h>
#include <time.h>
#include "allegro5/allegro.h"
#include "allegro5/allegro_primitives.h"
#include "f.h"

float jump;

void delay (unsigned int secs) {
    unsigned int retTime = time(0) + secs;   // Get finishing time.
    while (time(0) < retTime);               // Loop until it arrives.
};

void draw_bezieur(int points[5][2])
{
    int prev_x = points[0][0];
    int prev_y = points[0][1];
    float t = 0;
    float x, y;
    while (t<=1)
    {
        x = f(points[0][0], points[1][0], points[2][0], points[3][0], points[4][0], t);
        y = f(points[0][1], points[1][1], points[2][1], points[3][1], points[4][1], t);
        al_draw_line(x, y, prev_x, prev_y, al_map_rgb(50, 150, 50), 1);
        prev_x = x;
        prev_y = y;
        t+= jump;
    }
    al_draw_line(x, y, points[4][0], points[4][1], al_map_rgb(50, 150, 50), 1);
};

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        jump = 0.05;
    }
    else {
        jump = strtod(argv[1], NULL);
        if (sscanf(argv[1], "%f", &jump) != 1 || jump == 0.0 || jump > 1) {
            fprintf(stderr, "Error: input is not a valid float value\n");
            exit(EXIT_FAILURE);
        }
    }
    float pos_x, pos_y;
    al_init();
    al_init_primitives_addon();
    al_install_mouse();

    ALLEGRO_DISPLAY  *display = NULL;
    ALLEGRO_EVENT_QUEUE *event_queue = NULL;

    bool done = false;
    const int cols = 5;
    const int rows = 2;
    int points[cols][rows];
    int points_registered = 1;

    display = al_create_display(800, 800); //creating a window,
    event_queue = al_create_event_queue();
    al_register_event_source(event_queue, al_get_display_event_source(display));
    al_register_event_source(event_queue, al_get_mouse_event_source());

    al_clear_to_color(al_map_rgb(0, 0, 0));

    while (!done)
    {
        ALLEGRO_EVENT ev;
        al_wait_for_event(event_queue, &ev);

        if (ev.type == ALLEGRO_EVENT_DISPLAY_CLOSE) {
            done = true;
        }
        else if(ev.type == ALLEGRO_EVENT_MOUSE_BUTTON_DOWN) {
            if (points_registered == 6){
                al_clear_to_color(al_map_rgb(0, 0, 0));
                points_registered = 1;
            }
            pos_x = ev.mouse.x;
            pos_y = ev.mouse.y;
            points[points_registered - 1][0] = pos_x;
            points[points_registered - 1][1] = pos_y;

            al_draw_filled_circle(pos_x, pos_y, 2, al_map_rgb(50, 150, 50));

            points_registered++;
            delay(0.2);
            if (points_registered == 6){
                draw_bezieur(points);
            }
        }
        al_flip_display();  //displaying the window (the buffer)
    }
    al_destroy_display(display); //destroying the window
    return 0;
}
