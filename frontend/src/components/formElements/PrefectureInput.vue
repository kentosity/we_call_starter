<script setup lang="ts">
import { useFormStore } from '@/stores/registrationFormStore'
import prefectures from '@/assets/prefectures'
import Row from './FormRow.vue'

const formStore = useFormStore()
</script>

<template>
    <Row>
        <label for="state">都道府県</label>
        <select v-model="formStore.prefecture" id="state" name="state">
            <option v-for="(prefecture, ix) in prefectures" :value="prefecture" :key="ix">{{ prefecture }}</option>
        </select>
    </Row>
</template>