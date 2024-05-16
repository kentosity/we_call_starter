<script setup lang="ts">
import { useRouter } from 'vue-router'
import { onMounted, ref } from 'vue'
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

import { convertBirthday2Number, convertNumber2Birthday } from '@/helpers/birthdayInterpreter'
import { useFormStore } from '@/stores/registrationFormStore'
import { getAccessToken } from '@/helpers/lineAuthentication'

const router = useRouter()
const formStore = useFormStore()
const accessToken = getAccessToken()
const hasRecord = ref(false)

onMounted(async () => {
    const response = await axios.get('/api/entries/existing', { params: { access_token: accessToken } })
    hasRecord.value = response.status === 200
    const data = response.data
    const birthday = convertBirthday2Number(data.birthday)

    if (hasRecord.value) {
        formStore.updateData({
            ...data,
            ...birthday
        })
    }
})

const handleFormInput = async () => {
    const currentState = formStore.$state
    const birthday = convertNumber2Birthday(currentState)
    const base = '/api/entries'
    const requestBody = {
        access_token: accessToken,
        ...currentState,
        birthday,
    }

    let endpoint = base;
    let method = 'POST';

    // Check if a record exists
    if (hasRecord.value) {
        endpoint += '/existing';
        method = 'PUT';
    }

    const res = await axios({
        method: method,
        url: endpoint,
        data: requestBody
    });

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