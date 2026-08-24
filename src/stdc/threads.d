/*
    mbedd - 組み込みシステム向けのD言語標準ライブラリとDruntime
    Copyright (C) 2025 - Denkousi

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    Under Section 7 of GPL version 3, you are granted additional
    permissions described in the GCC Runtime Library Exception, version
    3.1, as published by the Free Software Foundation.

    You should have received a copy of the GNU General Public License and
    a copy of the GCC Runtime Library Exception along with this program;
    see the files LICENSE and LICENSE.RUNTIME respectively.  If not, see
    <http://www.gnu.org/licenses/>.
*/
module stdc.threads;
public import stdc.cheader.threads;

///
enum ONCE_FLAG_INIT = once_flag.init;

version(D_Ddoc)
{
    private
    {
        enum see_description = null;
        alias see_below = void;
    }
    ///
    enum TSS_DTOR_ITERATIONS = see_description;
    ///
    alias cnd_t = see_below;
    ///
    alias thrd_t = see_below;
    ///
    alias tss_t = see_below;
    ///
    alias mtx_t = see_below;
}
///
void call_once(once_flag* flag, void function() func);
///
int cnd_broadcast(cnd_t* cond);
///
void cnd_destroy(cnd_t* cond);
///
int cnd_init(cnd_t* cond);
///
int cnd_signal(cnd_t* cond);
///
int cnd_timedwait(cnd_t* cond, mtx_t* mtx, const timespec* ts);
///
int cnd_wait(cnd_t* cond, mtx_t* mtx);
///
void mtx_destroy(mtx_t* mtx);
///
int mtx_init(mtx_t* mtx, int type);
///
int mtx_lock(mtx_t* mtx);
///
int mtx_timedlock(mtx_t* mtx, const timespec* ts);
///
int mtx_trylock(mtx_t* mtx);
///
int mtx_unlock(mtx_t* mtx);
///
int thrd_create(thrd_t* thr, thrd_start_t func, void* arg);
///
thrd_t thrd_current();
///
int thrd_detach(thrd_t thr);
///
int thrd_equal(thrd_t thr0, thrd_t thr1);
///
noreturn thrd_exit(int res);
///
int thrd_join(thrd_t thr, int* res);
///
int thrd_sleep(const timespec* duration, timespec* remaining);
///
void thrd_yield();
///
int tss_create(tss_t* key, tss_dtor_t dtor);
///
void tss_delete(tss_t key);
///
void* tss_get(tss_t key);
///
int tss_set(tss_t key, void* val);