#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <stdint.h>

#include "f.h"

#include "allegro5/allegro.h"
#include "allegro5/allegro_image.h"
#include "allegro5/allegro_primitives.h"

#pragma pack(1)

#define OUTPUT_FILE_NAME "empty.bmp"

#define BMP_HEADER_SIZE 54
#define BMP_PIXEL_OFFSET 54
#define BMP_PLANES 1
#define BMP_BPP 24
#define BMP_HORIZONTAL_RES 500
#define BMP_VERTICAL_RES 500
#define BMP_DIB_HEADER_SIZE 40


float jump;

void delay (unsigned int secs) {
    unsigned int retTime = time(0) + secs;   // Get finishing time.
    while (time(0) < retTime);               // Loop until it arrives.
};

typedef struct {
    unsigned char sig_0;
    unsigned char sig_1;
    uint32_t size;
    uint32_t reserved;
    uint32_t pixel_offset;
    uint32_t header_size;
    uint32_t width;
    uint32_t height;
    uint16_t planes;
    uint16_t bpp_type;
    uint32_t compression;
    uint32_t image_size;
    uint32_t horizontal_res;
    uint32_t vertical_res;
    uint32_t color_palette;
    uint32_t important_colors;
} BmpHeader;

void write_bytes_to_bmp(unsigned  char *buffer, size_t size)
{
    FILE *file;

    file = fopen(OUTPUT_FILE_NAME, "wb");
    if (file == NULL)
    {
        printf("Could not open output file.");
        exit(-1);
    }
    fwrite(buffer, 1, size, file);
    fclose(file);
}

unsigned char *generate_empty_bitmap(unsigned int width, unsigned int height, size_t *output_size)
{
    unsigned int row_size = (width*3 + 3) & ~3; // possible padding
    *output_size = row_size * height + BMP_HEADER_SIZE;
    unsigned char *bitmap = (unsigned char *) malloc(*output_size);

    BmpHeader header;

    header.sig_0 = 'B';
    header.sig_1 = 'M';
    header.size = *output_size;
    header.reserved = 0;
    header.pixel_offset = BMP_PIXEL_OFFSET;
    header.header_size = BMP_DIB_HEADER_SIZE;
    header.width = width;
    header.height = height;
    header.planes = BMP_PLANES;
    header.bpp_type = BMP_BPP;
    header.compression = 0;
    header.image_size = row_size * height;
    header.horizontal_res = BMP_HORIZONTAL_RES;
    header.vertical_res = BMP_VERTICAL_RES;
    header.color_palette = 0;
    header.important_colors = 0;

    memcpy(bitmap, &header, BMP_HEADER_SIZE);
    for (int i = BMP_HEADER_SIZE; i <*output_size; ++i)
    {
        bitmap[i] = 0x00;
    }

    return bitmap;
}

void create_canvas()
{
    size_t bmp_size = 0;
    unsigned char *bmp_buffer = generate_empty_bitmap(800, 800, &bmp_size);
    write_bytes_to_bmp(bmp_buffer, bmp_size);
}

int main(int argc, char *argv[]) {
    if (argc < 2)
    {
        jump = 0.5;
    }
    else {
        jump = strtod(argv[1], NULL);
        if (sscanf(argv[1], "%f", &jump) != 1 || jump == 0.0 || jump > 1) {
            fprintf(stderr, "Error: input is not a valid float value\n");
            exit(EXIT_FAILURE);
        }
    }
    create_canvas();

    int pos_x, pos_y;

    al_init();
    al_init_image_addon();
    al_init_primitives_addon();
    al_install_mouse();

    ALLEGRO_DISPLAY  *display = NULL;
    ALLEGRO_BITMAP *bitmap = NULL;
    ALLEGRO_EVENT_QUEUE *event_queue = NULL;

    bool done = false;
    const int cols = 5 * 2;
    int points[cols];
    int points_registered = 2;

    display = al_create_display(800, 800); //creating a window,
    bitmap = al_load_bitmap("empty.bmp");
    event_queue = al_create_event_queue();
    al_register_event_source(event_queue, al_get_display_event_source(display));
    al_register_event_source(event_queue, al_get_mouse_event_source());

    al_draw_bitmap(bitmap, 0, 0, 0);
    while (!done)
    {
        ALLEGRO_EVENT ev;
        al_wait_for_event(event_queue, &ev);

        if (ev.type == ALLEGRO_EVENT_DISPLAY_CLOSE) {
            done = true;
        }
        else if(ev.type == ALLEGRO_EVENT_MOUSE_BUTTON_DOWN) {
            if (points_registered == 12){
//                for (int i = 2; i < 12; i += 2)
//                {
//                    printf("%d", points[i-2]);
//                    printf(" ");
//                    printf("%d", points[i-1]);
//                    printf("\n");
//                }
                create_canvas();
                al_draw_bitmap(bitmap, 0, 0, 0);
                points_registered = 2;
            }
            pos_x = ev.mouse.x;
            pos_y = ev.mouse.y;
            points[points_registered - 2] = pos_x;
            points[points_registered - 1] = pos_y;

            al_draw_filled_circle(pos_x, pos_y, 2, al_map_rgb(50, 150, 50));

            points_registered += 2;
            delay(0.2);
            if (points_registered == 12){
                printf("%d", f(points, jump));
            }
        }
        al_flip_display();  //displaying the window (the buffer)
    }
    al_destroy_display(display); //destroying the window
    return 0;
}


