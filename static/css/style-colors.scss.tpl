{#/*============================================================================
  style-colors.scss.tpl
  VERSÃO UNIFICADA: Estrutura Amazonas + Identidade Carol Viana
==============================================================================*/#}

// ——————————————————————————————————————————————————————————————————————————————————————————————————————
// 1. Definição de Variáveis (Vindas do settings.txt e Painel)
// ——————————————————————————————————————————————————————————————————————————————————————————————————————

$primary-color: {{ settings.primary_color | default('#89a05a') }}; // Verde oliva da sua marca
$secondary-color: {{ settings.secondary_color | default('#ede6e1') }}; // Bege do seu footer
$text-color: {{ settings.text_color | default('#51453c') }};

// Configuração de arredondamento dinâmica
$rounded-radius: {% if settings.rounded_corners %} 12px {% else %} 0 {% endif %};

:root {
    --primary-color: #{$primary-color};
    --bg-color: #{$secondary-color};
    --text-color: #{$text-color};
    --border-radius: #{$rounded-radius};
}

// ——————————————————————————————————————————————————————————————————————————————————————————————————————
// 2. Integração do seu CSS Avançado (Carol Viana)
// ——————————————————————————————————————————————————————————————————————————————————————————————————————

footer {
	color: #51453c;
	background: #ede6e1;
}

.section-brands-home {
	background: #ede6e1;
}

h3, .h3 {
	font-size: 14px;
	font-weight: 600;
}

.btn-primary, .btn-main {
	padding: 13px;
	background-color: #89a05a !important; // Mantendo o seu verde oliva
	color: #f9f9f9 !important;
	fill: #f9f9f9;
	letter-spacing: 2px;
	font-weight: bold;
    border: none;
    border-radius: var(--border-radius);
    transition: all 0.3s ease;

    &:hover {
        opacity: 0.9;
        filter: brightness(90%);
    }
}

.alert-warning {
	color: #d27611;
	border-color: #d27611;
	display: none;
}

.brand-image {
	border-radius: 25px;
	max-height: 210px !important;
}

// Banner Automático na Descrição do Produto
#product-description::before {
	content: "";
	display: block;
	width: 100%;
	height: 400px;
	background-image: url("https://d1a9qnv764bsoo.cloudfront.net/stores/004/628/203/rte/peçcas.jpg");
	background-size: contain;
	background-position: center;
	background-repeat: no-repeat;
	margin-bottom: 20px;
}

// Grid de Imagens 1:1 (Quadradas) conforme sua regra atual
.item-image, 
.product-item-image, 
.product-image, 
.imagem-produto, 
.listagem-produtos img {
	width: 100% !important; 
	aspect-ratio: 1 / 1;    
	object-fit: cover !important;
	display: block;
	margin: auto;
	max-width: 100%;
    border-radius: var(--border-radius);
}

// ——————————————————————————————————————————————————————————————————————————————————————————————————————
// 3. Ajustes de Estrutura do Tema Amazonas
// ——————————————————————————————————————————————————————————————————————————————————————————————————————

{% if settings.header_search_full %}
.js-search-container {
    width: 100%;
    max-width: 600px;
    margin: 0 auto;
    .form-control {
        border-radius: 25px; // Busca arredondada do Amazonas
        border: 1px solid #ddd;
        padding-left: 20px;
    }
}
{% endif %}

.item-grid {
    border-radius: var(--border-radius);
    overflow: hidden;
    background: #fff;
    padding-bottom: 10px;
    margin-bottom: 20px;
    transition: transform 0.3s ease;
    
    &:hover {
        transform: translateY(-5px); // Efeito suave ao passar o rato
    }
}