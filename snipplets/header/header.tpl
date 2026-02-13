{#/*============================================================================
  header.tpl
  Estrutura baseada no Tema Amazonas: Busca em destaque e utilitários organizados.
==============================================================================*/#}

<header class="js-header-container header {% if settings.header_sticky %}header-sticky{% endif %}" data-store="header">
    
    {# Barra de Anúncios (Advertising Bar) #}
    {% if settings.ad_bar_enabled %}
        {% include "snipplets/header/header-advertising.tpl" %}
    {% endif %}

    <div class="container">
        <div class="row align-items-center py-3">
            
            {# 1. Menu Mobile e Logo #}
            <div class="col-auto d-lg-none">
                <div class="js-menu-button btn-header">
                    {% include "snipplets/svg/bars.tpl" with {class: "svg-icon-primary"} %}
                </div>
            </div>

            <div class="col col-lg-3 text-center text-lg-left">
                {{ lib.logo() }}
            </div>

            {# 2. Barra de Busca (Estilo Amazonas: Central e Larga) #}
            <div class="col-12 col-lg-6 order-3 order-lg-2 mt-3 mt-lg-0">
                <div class="header-search-container {% if settings.header_search_full %}search-full{% endif %}">
                    <form action="{{ store.search_url }}" method="get" class="js-search-container">
                        <div class="form-group mb-0 position-relative">
                            <input class="js-search-input form-control header-search-input" type="search" name="q" placeholder="{{ 'Buscar produtos...' | translate }}" aria-label="{{ 'Buscar' | translate }}" autocomplete="off" />
                            <button type="submit" class="btn btn-search" aria-label="{{ 'Buscar' | translate }}">
                                {% include "snipplets/svg/search.tpl" with {class: "svg-icon-primary"} %}
                            </button>
                        </div>
                    </form>
                    {# Resultados da busca (AJAX) #}
                    <div class="js-search-suggest search-suggest">
                         {# Snipplet de resultados carregado via JS #}
                    </div>
                </div>
            </div>

            {# 3. Utilitários (Conta e Carrinho) #}
            <div class="col-auto col-lg-3 order-2 order-lg-3 text-right d-flex justify-content-end align-items-center">
                
                {# Minha Conta #}
                <div class="d-none d-lg-inline-block mr-3">
                    {% if customer %}
                        <a href="{{ store.customer_home_url }}" class="header-link">
                            {% include "snipplets/svg/user.tpl" with {class: "svg-icon-primary d-inline-block align-middle"} %}
                            <span class="d-none d-xl-inline-block ml-1">{{ customer.first_name }}</span>
                        </a>
                    {% else %}
                        <a href="{{ store.customer_login_url }}" class="header-link">
                            {% include "snipplets/svg/user.tpl" with {class: "svg-icon-primary d-inline-block align-middle"} %}
                            <span class="d-none d-xl-inline-block ml-1">{{ 'Entrar' | translate }}</span>
                        </a>
                    {% endif %}
                </div>

                {# Carrinho #}
                <div class="header-cart-container">
                    {% include "snipplets/header/header-utilities.tpl" %}
                </div>
            </div>
        </div>

        {# 4. Navegação Principal (Desktop) #}
        <div class="row d-none d-lg-block">
            <div class="col-12 text-center border-top pt-2 mt-2">
                {% include "snipplets/navigation/navigation.tpl" %}
            </div>
        </div>
    </div>
</header>