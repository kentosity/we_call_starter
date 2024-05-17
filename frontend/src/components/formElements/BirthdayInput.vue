<script setup lang="ts">
import Row from './FormRow.vue'
import Input from '../Input.vue'
</script>

<template>
    <Row>
        <p class="alt-label">生年月日</p>
        <div class="inline-inputs">
            <Input id="year" type="number" :model="'year'" />
            <span>年</span>
            <Input id="month" type="number" :model="'month'" />
            <span>月</span>
            <Input id="date" type="number" :model="'date'" />
            <span>日</span>
        </div>
    </Row>
</template>