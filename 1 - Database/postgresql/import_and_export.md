
### Export
```bash
pg_dump -U deploy du_hoc_center_production > bdc_production_db.pgsql
```

### Import
```bash
psql -U huydo du_hoc_center_development < bdc_production_db.pgsql
```
