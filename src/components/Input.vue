<script setup lang="ts">
import { StateInterface, useStore } from '../store';

const props = defineProps<{
    id: string
    label?: string
    type: 'text' | 'radio' | 'email' | 'number',
    model: keyof StateInterface
}>()

const st = useStore()
</script>

<template>
    <div>
        <label v-if="label" :for="props.id">{{ props.label }}</label>
        <input v-model="st[props.model]" :id="props.id" :type="props.type">
    </div>
</template>