# EduFin SQL Challenge — Phase 1 & 4 Review Summary

## Overall Status: ❌ PHASE 1 NOT COMPLETE | ✅ PHASE 4 MOSTLY CORRECT

---

## PHASE 1: CRITICAL ISSUES

### Issue 1: Query 1A Missing Status Distribution
**Problem:** Only exploratory checks, missing required GROUP BY loan_status query
**Fix:** Add query showing count and percentage per status (Active, Defaulted, Overdue, Closed)
```sql
SELECT 
    loan_status, 
    COUNT(*) AS loan_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM loans
GROUP BY loan_status
ORDER BY loan_count DESC
```

---

### Issue 2: Query 1B Missing Key Metrics
**Missing:**
- `COUNT(DISTINCT customer_id)` — total unique customers
- `ROUND(AVG(loan_amount) / 100000.0, 2)` — average loan size in Lakhs

**Typo:** `deafulted` → should be `defaulted`

---

### Issue 3: Query 1C Wrong Metric
**Problem:** Using `loss_rate` (amount-based) instead of `portfolio_at_risk_pct` (count-based)

**Current:** `(Defaulted Amount / Total Amount) × 100`
**Required:** `COUNT(Defaulted + Overdue) / Total Loans × 100`

```sql
ROUND(
    COUNT(CASE WHEN loan_status IN ('Defaulted', 'Overdue') THEN 1 END) * 100.0 / COUNT(*),
    2
) AS portfolio_at_risk_pct
```

---

### Issue 4: Query 1D CRITICAL ERROR — Excludes Overdue Loans
**Problem:** At-risk calculation only includes Defaulted, not Overdue

**Current:** `WHERE loan_status = 'Defaulted'`
**Required:** `WHERE loan_status IN ('Defaulted', 'Overdue')`

**Impact:** Significantly underestimates portfolio risk exposure

---

### Issue 5: Query 1E Incomplete Dashboard
**Missing metrics:**
- Total customers (from Query 1B)
- Total portfolio value in Crores (from Query 1B)
- Average loan size in Lakhs (from Query 1B)
- Portfolio at risk % count-based (from Query 1C)
- At-risk amount including BOTH Defaulted + Overdue (from Query 1D)
- Recommended board action

---

### Issue 6: WHY Gate Q1 — Wrong Understanding of At-Risk Definition
**Your Answer:** Only defaulted loans (realized losses), not overdue (potential losses)

**Correct Answer:** **Must include BOTH Defaulted AND Overdue** per BRD explicit definition
- Board needs total capital under stress consuming resources
- At-risk includes all loans requiring immediate intervention

---

### Issue 7: WHY Gate Q3 — Wrong Priority Metric
**Your Answer:** ₹24.24 Crores (loss amount) is most important

**Correct Answer:** **Default rate percentage (11.80%)** is most important
- CEO's direct quote in BRD explicitly asks for default rate metric
- Percentage shows if crisis is systemic (1 in 10 loans fail = broken model)
- Loss amount alone doesn't reveal systemic failure vs. bad luck

---

## PHASE 4: STRENGTHS & ISSUES

### ✅ Strengths
- **Query 4B:** Correct default rate with HAVING >= 50 filter and 15% threshold ✓
- **Query 4D:** Correct classification logic (Blacklist >15%, Probation >5%, Preferred) ✓
- **Query 4E:** Complete dashboard with proper thresholds and window functions ✓
- **Custom Column:** Advanced thinking with portfolio-relative classifications ✓
- **WHY Gate 2:** Comprehensive suspension justification with metrics and action plans ✓

---

### 🔴 Issues

#### Issue 1: Query 4A — Misleading Title + Missing Metrics
**Title says:** "Partner Health Score"
**Actually delivers:** Volume metrics only

**Missing:**
- `COUNT(DISTINCT customer_id)` — unique customers per institution
- `institution_type` column in SELECT and GROUP BY
- `HAVING COUNT(loan_id) >= 50` filter (MANDATORY for Phase 4)

**Action:** Rename to "Basic Volume Metrics" OR add health score formula

---

#### Issue 2: Query 4C — Incomplete Financial Attribution
**Missing:**
- `total_portfolio_value_cr` (all loans, no WHERE filter)
- `at_risk_amount_cr` should include Defaulted + Overdue combined

**Current:** `WHERE loan_status = 'Defaulted'` (only defaults)
**Required:** Also calculate at-risk with `WHERE loan_status IN ('Defaulted', 'Overdue')`

---

## PRIORITY FIX ORDER

### Phase 1 (Do First)
1. ⚠️ Query 1A: Add GROUP BY loan_status with percentages
2. ⚠️ Query 1B: Add COUNT(DISTINCT customer_id) and avg_loan_size_lakhs
3. ⚠️ Query 1C: Replace loss_rate with portfolio_at_risk_pct (count-based, include Overdue)
4. 🔴 **Query 1D: Change WHERE to include Overdue loans** (CRITICAL)
5. ⚠️ Query 1E: Add all missing metrics from 1A-1D
6. ⚠️ WHY Q1: State at-risk MUST include Defaulted + Overdue per BRD
7. ⚠️ WHY Q3: State default rate % (11.80%) is most important per CEO's explicit requirement

### Phase 4 (Do Second)
1. ⚠️ Query 4A: Add customer count, institution_type, HAVING >= 50 filter
2. ⚠️ Query 4C: Add total_portfolio_value_cr and at_risk_amount_cr (Defaulted + Overdue)

---

## KEY TAKEAWAY

**The recurring error:** Excluding Overdue loans from at-risk calculations

**Why it matters:** 
- Overdue loans are defaults waiting to happen
- Board needs total exposure under stress, not just written-off losses
- BRD explicitly requires both statuses combined in at-risk metrics

**Your strength:** Custom analytical thinking (risk tiers, health scores)
**Your gap:** Not following BRD explicit requirements exactly as stated

---

## Gate Status

| Phase | Status | Notes |
|-------|--------|-------|
| **Phase 1** | ❌ NOT COMPLETE | 7 issues including critical Overdue exclusion |
| **Phase 4** | ✅ MOSTLY CORRECT | 2 issues in queries 4A & 4C; 4B-4E solid |

**Next Step:** Fix all Phase 1 issues first. Phase 4 is close but needs metric additions.