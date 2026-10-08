---
title: Gestión de Dependencias
description: Actualizaciones automatizadas de dependencias, configuración de Renovate y flujos del Dependency Dashboard.
---

StellarView Docs utiliza [Renovate](https://docs.renovatebot.com/) para la actualización automatizada de dependencias y el mantenimiento de lockfiles en todo el repositorio.

## Descripción General

Las actualizaciones automatizadas mantienen al día los frameworks frontend, plugins de Astro y acciones de GitHub Actions minimizando el ruido mediante pull requests agrupados y programación por lotes.

- **Motor de Automatización**: Renovate bot (`renovate[bot]`)
- **Centro de Seguimiento**: [Dependency Dashboard](https://github.com/StellarViewOrg/stellarview-docs/issues/15) en vivo administrado mediante GitHub Issues
- **Configuración Principal**: `renovate.json` en la raíz del repositorio

## Configuración (`renovate.json`)

La configuración del repositorio extiende los ajustes recomendados de Renovate:

```json
{
  "$schema": "https://docs.renovatebot.com/renovate-schema.json",
  "extends": ["config:recommended"],
  "timezone": "UTC",
  "schedule": ["before 6am on monday"],
  "prConcurrentLimit": 5,
  "packageRules": [
    {
      "matchManagers": ["npm"],
      "matchUpdateTypes": ["minor", "patch"],
      "groupName": "minor and patch dependencies"
    },
    {
      "matchManagers": ["github-actions"],
      "groupName": "github actions"
    }
  ],
  "lockFileMaintenance": {
    "enabled": true,
    "schedule": ["before 6am on monday"]
  }
}
```

### Políticas Clave

1. **Programación**: Las comprobaciones de dependencias y generación de PRs se ejecutan semanalmente antes de las **6:00 AM UTC los lunes**. Esto previene ruido en las builds durante ciclos activos de desarrollo.
2. **Límite de Concurrencia (`prConcurrentLimit: 5`)**: Como máximo se mantienen abiertos 5 PRs automatizados simultáneamente para no sobrecargar los runners de CI ni a los revisores de código.
3. **Actualizaciones Agrupadas**:
   - Las actualizaciones menores y parches de `npm` se consolidan en un único PR agrupado (`minor and patch dependencies`).
   - Las actualizaciones de workflows de GitHub Actions se agrupan en un PR específico (`github actions`).
4. **Mantenimiento del Lockfile**: La verificación y actualización automática de `bun.lock` se ejecuta semanalmente los lunes para resolver desincronizaciones de dependencias transitivas.

## Ecosistemas y Paquetes Monitoreados

Renovate supervisa dependencias de Node.js/Bun y acciones de workflows de CI:

### Ecosistema `package.json`

| Paquete | Rol | Estrategia de Actualización |
| :--- | :--- | :--- |
| `astro` | Framework web principal | Menor/parche agrupado; PR mayor aislado |
| `@astrojs/starlight` | Tema y enrutamiento de documentación | Menor/parche agrupado; verificado con validador de enlaces |
| `@astrojs/tailwind` / `tailwindcss` | Motor de utilidades CSS y plugin Vite | Actualizaciones agrupadas |
| `@astrojs/check` / `typescript` | Verificación estática de tipos | Actualizaciones agrupadas |
| `sharp` | Optimización de imágenes de alto rendimiento | Actualizaciones agrupadas |
| `starlight-links-validator` | Validación de integridad de enlaces | Actualizaciones agrupadas |

### GitHub Actions (`.github/workflows/`)

- `actions/checkout`
- `actions/setup-node`
- `oven-sh/setup-bun`

## Operaciones del Dependency Dashboard

Renovate mantiene un Dependency Dashboard activo en el issue tracker del repositorio (Issue `#15`).

> [!NOTE]
> El issue del Dependency Dashboard permanece permanentemente abierto. Cerrar este issue inhabilita la capacidad de Renovate para presentar rebases programados, actualizaciones pendientes y controles de reintento.

### Capacidades del Dashboard

- **Actualizaciones Pendientes**: Muestra dependencias planificadas para la siguiente ventana de mantenimiento los lunes.
- **Activación Manual de PR**: Los mantenedores pueden marcar casillas en el dashboard para solicitar un PR inmediato antes de la ventana programada.
- **Rebase y Reintento**: Marcar la casilla de rebase en PRs abiertos de Renovate fuerza un rebase git automático contra la rama destino (`main`).

## Flujo de Verificación Local

Antes de fusionar actualizaciones de dependencias o enviar PRs relacionados, verifique localmente la instalación y la generación de documentación:

```bash
# Instalar dependencias
bun install

# Verificar comprobación de tipos
bun run check

# Generar sitio estático y validar enlaces
bun run build
```
