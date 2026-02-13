{#/*============================================================================
  item.tpl
  Card de produto estruturado para o Tema Amazonas (Imagens grandes e bordas suaves)
==============================================================================*/#}

{% set product_image_size = settings.product_image_size | default('large') %}

<div class="js-item-product item-grid" data-product-type="list" data-product-id="{{ product.id }}" data-store="product-item-{{ product.id }}">
    
    {# Imagem do Produto #}
    <div class="item-image-container position-relative">
        <a href="{{ product.url }}" title="{{ product.name }}" aria-label="{{ product.name }}">
            {# Labels de Oferta ou Esgotado #}
            {% include "snipplets/labels.tpl" %}
            
            {# Imagem com Lazy Load (Lazysizes) #}
            <div class="p-relative">
                <img src="{{ product.featured_image | product_image_url('tiny') }}" 
                     data-src="{{ product.featured_image | product_image_url(product_image_size) }}" 
                     class="js-item-image lazyload img-fluid w-100" 
                     alt="{{ product.featured_image.alt }}" />
            </div>
        </a>
        
        {# Botão de Compra Rápida (Opcional - Estilo Amazonas) #}
        {% if settings.quick_shop %}
            <div class="item-quickshop-container d-none d-lg-block">
                {% include "snipplets/grid/quick-shop.tpl" %}
            </div>
        {% endif %}
    </div>

    {# Informações do Produto #}
    <div class="item-description mt-2">
        <a href="{{ product.url }}" title="{{ product.name }}" class="item-link">
            <h3 class="item-name mb-1">{{ product.name }}</h3>
            
            <div class="item-price-container" data-store="product-item-price-{{ product.id }}">
                {% if product.compare_at_price > product.price %}
                    <span class="item-price-compare text-muted small">
                        <del>{{ product.compare_at_price | money }}</del>
                    </span>
                {% endif %}
                <span class="item-price d-block font-weight-bold">
                    {{ product.price | money }}
                </span>
            </div>

            {# Exibição de Parcelamento (Se configurado) #}
            {% if product.installments %}
                <div class="item-installments small mt-1 text-primary">
                    {{ product.installments.max_installments_without_interest.number }}x {{ product.installments.max_installments_without_interest.amount | money }}
                </div>
            {% endif %}
        </a>
        
        {# Cores disponíveis (Snipplet nativo do Base) #}
        {% include "snipplets/grid/item-colors.tpl" %}
    </div>
</div>