package com.example.demo._lock.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LockInfo {

    private String lockName = "lock";

    private String lockValue = "0";

    private Integer waitTime = 3;

    private Integer leaseTime = 20;

    private Integer frequency = 4;

}
