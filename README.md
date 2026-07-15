# Grupo Éxito

Prueba técnica para Grupo Éxito: app de catálogo y carrito de compras hecha con Flutter.

## Requisitos

- Flutter 3.44.1 (Dart 3.12.1)
- Un archivo `.env` en la raíz con la variable `BASE_URL`

> **Nota:** para esta prueba técnica el archivo `.env` se incluye en el repositorio (no está en `.gitignore`) a propósito, para facilitar la revisión sin pasos adicionales de configuración.

## Primer arranque

Si es la primera vez que corres el proyecto, usa:

```
make init
```

Esto instala las dependencias, genera el código (Riverpod, Freezed, Injectable) y crea los íconos y el splash nativo.

## Correr el proyecto

Una vez inicializado, para levantar la app:

```
flutter run
```

## Otros comandos útiles

| Comando | Qué hace |
|---|---|
| `make gen` | Regenera el código cuando cambias providers, modelos o inyección de dependencias |
| `make generate-watch` | Igual que `gen` pero en modo watch |
| `make icons` | Regenera los íconos de la app |
| `make splash` | Regenera el splash nativo |
| `make clean-gen` | Limpia el código generado |
