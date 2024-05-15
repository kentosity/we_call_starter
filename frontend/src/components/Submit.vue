<script setup lang="ts">
const emit = defineEmits(['submit'])
</script>

<template>
    <button @click.prevent="emit('submit')">来場日時の選択へ</button>
</template>