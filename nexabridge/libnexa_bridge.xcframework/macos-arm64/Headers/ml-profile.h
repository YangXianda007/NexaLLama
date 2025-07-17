#pragma once

#include <chrono>
#include <cstdint>

#include "ml.h"

#ifdef __cplusplus
extern "C" {
#endif

enum ml_StopReason {
    ML_STOP_REASON_UNKNOWN = 0,
    ML_STOP_REASON_EOS,
    ML_STOP_REASON_LENGTH,
    ML_STOP_REASON_USER,
    ML_STOP_REASON_STOP_SEQUENCE,
    ML_STOP_REASON_COMPLETED
};

typedef std::chrono::steady_clock::time_point timestamp;

typedef struct ml_ProfilingContext {
    timestamp start_time;
    timestamp prompt_start_time;
    timestamp prompt_end_time;
    timestamp decode_start_time;
    timestamp decode_end_time;
    timestamp first_token_time;
    timestamp end_time;

    bool          ttft_recorded;
    ml_StopReason stop_reason;
    uint32_t      prompt_tokens;
    uint32_t      generated_tokens;
} ml_ProfilingContext;

void ml_profiling_reset(ml_ProfilingContext* ctx);

void ml_profiling_start(ml_ProfilingContext* ctx);

void ml_profiling_prompt_start(ml_ProfilingContext* ctx);

void ml_profiling_prompt_end(ml_ProfilingContext* ctx);

void ml_profiling_decode_start(ml_ProfilingContext* ctx);

void ml_profiling_decode_end(ml_ProfilingContext* ctx);

void ml_profiling_record_ttft(ml_ProfilingContext* ctx);

void ml_profiling_update_prompt_tokens(ml_ProfilingContext* ctx, uint32_t prompt_tokens);

void ml_profiling_update_generated_tokens(ml_ProfilingContext* ctx, uint32_t generated_tokens);

void ml_profiling_stop_reason(ml_ProfilingContext* ctx, ml_StopReason stop_reason);

void ml_profiling_end(ml_ProfilingContext* ctx);

void ml_profiling_gen_data(const ml_ProfilingContext* ctx, ml_ProfilingData* out);

const char* stop_reason_to_string(ml_StopReason reason);

#ifdef __cplusplus
}
#endif