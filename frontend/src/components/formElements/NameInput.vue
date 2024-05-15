<script setup lang="ts">
import Row from './FormRow.vue'
import Input from '../Input.vue'
</script>

<template>
    <Row :two-col="true">
        <Input id="surname" label="姓" type="text" :model="'surname'" />
        <Input id="name" label="名" type="text" :model="'name'" />
    </Row>
</template>