{# Identifica se o slide é um vídeo através da descrição #}
{% set video_url = '' %}
{% set clean_description = slide.description %}

{% if slide.description and slide.description starts with 'VIDEO::' %}
    {# Separa o prefixo da descrição real, se houver #}
    {% set parts = slide.description | split(' ', 2) %}
    {% set video_url = parts[0] | replace('VIDEO::', '') %}
    {% set clean_description = (parts | length > 1) ? parts[1] : '' %}
{% endif %}

{% set is_video = video_url is not empty %}

<div class="swiper-slide slide-container">
    {% if is_video %}
        {# Container do vídeo com proporção 16:9 responsiva #}
        <div class="embed-responsive embed-responsive-16by9">
            {% if 'youtube.com' in video_url or 'youtu.be' in video_url %}
                {% set video_id = video_url | replace('https://www.youtube.com/watch?v=', '') | replace('https://youtu.be/', '') | replace('https://www.youtube.com/embed/', '') | split('&') | first | split('?') | first %}
                <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/{{ video_id }}?autoplay=1&mute=1&loop=1&playlist={{ video_id }}&controls=0&modestbranding=1" allow="autoplay; encrypted-media" allowfullscreen></iframe>
            {% elseif 'vimeo.com' in video_url %}
                {% set video_id = video_url | split('/') | last | split('?') | first %}
                <iframe class="embed-responsive-item" src="https://player.vimeo.com/video/{{ video_id }}?autoplay=1&loop=1&background=1" allow="autoplay; encrypted-media" allowfullscreen></iframe>
            {% endif %}
        </div>
    {% else %}
        {# Mantém a imagem original se não for vídeo #}
        <div class="slider-slide">
            <img src="{{ slide.image | static_url | settings_image_url('original') }}" class="slider-image" alt="{{ 'Carrusel' | translate }}">
        </div>
    {% endif %}

    {# Texto sobreposto (Título/Botão) #}
    {% if slide.title or clean_description %}
        <div class="swiper-text">
            {% if slide.title %}<h2>{{ slide.title }}</h2>{% endif %}
            {% if clean_description %}<p>{{ clean_description }}</p>{% endif %}
        </div>
    {% endif %}
</div>
