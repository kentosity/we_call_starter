<script setup lang="ts">
const emit = defineEmits(['submit'])
</script>

<template>
    <button @click.prevent="emit('submit')">上記の内容で登録</button>
</template>