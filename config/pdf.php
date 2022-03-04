<?php

return [
    'mode'                    => 'utf-8',
    'format'                  => 'legal',
    'default_font_size'       => '14',
    'default_font'            => 'bangla',
    'margin_left'             => 10,
    'margin_right'            => 10,
    'margin_top'              => 10,
    'margin_bottom'           => 10,
    'margin_header'           => 0,
    'margin_footer'           => 0,
    'orientation'             => 'P',
    'title'                   => 'দলিল ম্যানেজম্যান্ট',
    'author'                  => '',
    'watermark'               => '',
    'show_watermark'          => true,
    'watermark_font'          => 'bangla',
    'display_mode'            => 'fullpage',
    'watermark_text_alpha'    => 0.1,
    'custom_font_dir'         => base_path('resources/fonts/'),
    'custom_font_data'        => [
        'bangla' => [
            'R'  => 'SolaimanLipi_22-02-2012.ttf',    // regular font
            'B'  => 'SolaimanLipi_Bold_10-03-12.ttf',       // optional: bold font
            'I'  => 'SolaimanLipi_22-02-2012.ttf',     // optional: italic font
            'BI' => 'SolaimanLipi_Bold_10-03-12.ttf', // optional: bold-italic font
            'useOTL' => 0xFF,    
            'useKashida' => 75, 
        ]
    ],
    
    'auto_language_detection' => false,
    'temp_dir'                => __DIR__ . '/public/mpdf',
    'pdfa'                    => false,
    'pdfaauto'                => false,
];
