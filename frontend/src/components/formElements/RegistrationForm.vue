<script setup lang="ts">
import { useRouter } from 'vue-router'
import axios from 'axios'

import NameInput from '@/components/formElements/NameInput.vue'
import NameKanaInput from '@/components/formElements/NameKanaInput.vue'
import GenderInput from '@/components/formElements/GenderInput.vue'
import BirthdayInput from '@/components/formElements/BirthdayInput.vue'
import PrefectureInput from '@/components/formElements/PrefectureInput.vue'
import AddressInput from '@/components/formElements/AddressInput.vue'
import EmailInput from '@/components/formElements/EmailInput.vue'

import Caution from '@/components/Caution.vue'
import Submit from '@/components/Submit.vue'

import { useFormStore } from '@/stores/registrationFormStore';
import { getLineProfile } from '@/helpers/lineAuthentication'
const router = useRouter()
const formStore = useFormStore()

async function handleFormInput() {
    const profile = await getLineProfile()

    const currentState = formStore.$state
    const birthday = `${currentState.year}-${currentState.month}-${currentState.date}`

    const res = await axios.post('/api/entries', {
        uid: profile.userId,
        ...currentState,
        birthday,
    })

    router.push({ path: '/result', query: res.data })
}
</script>

<template>
    <form>
        <NameInput></NameInput>

        <NameKanaInput></NameKanaInput>

        <GenderInput></GenderInput>

        <BirthdayInput></BirthdayInput>

        <PrefectureInput></PrefectureInput>

        <AddressInput></AddressInput>

        <EmailInput></EmailInput>

        <Caution :msg="'本イベントに関して、ご連絡させていただく可能性がございます。'" />

        <Submit @submit="handleFormInput" />
    </form>
</template>