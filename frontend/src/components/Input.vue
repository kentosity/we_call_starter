<script setup lang="ts">
import { useFormStore } from '@/stores/registrationFormStore';
import { RegistrationFormState } from '@/types';

const props = defineProps<{
    id: string
    label?: string
    type: 'text' | 'radio' | 'email' | 'number',
    model: keyof RegistrationFormState
}>()

const formStore = useFormStore()
</script>

<template>
    <div>
        <label v-if="label" :for="props.id">{{ props.label }}</label>
        <input v-model="formStore[props.model]" :id="props.id" :type="props.type">
    </div>
</template>