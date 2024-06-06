# Teams-SharePoint-Integration

Este repositório contém um script em PowerShell que automatiza a criação de grupos no Microsoft Teams e a configuração de uma estrutura de pastas no site do SharePoint associado. Ideal para organizações que desejam padronizar e agilizar a configuração de novos grupos e suas respectivas estruturas de pastas, integrando de forma eficaz o Teams e o SharePoint.

## Funcionalidades

- Criação automática de grupos no Microsoft Teams.
- Configuração de uma estrutura de pastas predefinida no site do SharePoint correspondente.
- Sincronização perfeita com o Teams para uso imediato da estrutura de pastas.

## Requisitos

- PowerShell 5.1 ou superior.
- Módulo MicrosoftTeams.
- Módulo PnP.PowerShell.
- Permissões administrativas no Teams e SharePoint.

## Instruções de Instalação

1. Clone este repositório:
    ```sh
    git clone https://github.com/seu-usuario/Teams-SharePoint-Integration.git
    ```

2. Navegue até o diretório do projeto:
    ```sh
    cd Teams-SharePoint-Integration
    ```

3. Execute o script:
    ```sh
    .\setup-teams-sharepoint.ps1
    ```

## Como Usar

1. Edite o script para configurar as variáveis `$folders`, `$site`, `$sites`, e `$projeto` conforme necessário:
    ```powershell
    $folders = @("pasta1", "pasta2", "pasta3")
    $site = "https://seu-dominio.sharepoint.com"
    ```

2. Execute o script:
    ```powershell
    .\setup-teams-sharepoint.ps1
    ```

3. Quando solicitado, digite o nome do projeto. O script então:
    - Criará um novo grupo no Microsoft Teams com o nome do projeto.
    - Conectará ao site do SharePoint associado ao grupo.
    - Criará as pastas especificadas no array `$folders` dentro do diretório "Documentos Compartilhados/General".

## Detalhes do Script

O script executa as seguintes etapas:

1. **Importação dos Módulos**:
    - Importa o módulo MicrosoftTeams, instalando-o se necessário.
    - Importa o módulo PnP.PowerShell, instalando-o se necessário.

2. **Conexão ao Microsoft Teams**:
    - Conecta ao Microsoft Teams.

3. **Criação do Grupo no Teams**:
    - Solicita ao usuário o nome do projeto.
    - Cria um novo grupo no Microsoft Teams com o nome fornecido.

4. **Conexão ao SharePoint**:
    - Conecta ao site do SharePoint associado ao grupo criado.

5. **Criação das Pastas no SharePoint**:
    - Cria as pastas especificadas no array `$folders` dentro do diretório "Documentos Compartilhados/General" do site do SharePoint.

## Contribuição

Contribuições são bem-vindas! Por favor, abra uma issue ou envie um pull request para melhorias, correções de bugs ou novas funcionalidades.
